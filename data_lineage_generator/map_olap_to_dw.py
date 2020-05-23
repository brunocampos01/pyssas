import collections
import os
import sys
import re
import pprint
import pickle
import pandas as pd

here = os.path.abspath(os.path.dirname(__file__))
path_outside = os.path.join(here + '/..')
sys.path.insert(1, path_outside)
import config
from utils.files import *
from utils.db_helper import *


path = os.path.join(here + '/../..')
path_analysis_services = config.PATHS['ssas']
path_tmp = config.PATHS['tmp']
relative_olap_path = os.path.join(path + path_analysis_services)

pp = pprint.PrettyPrinter(width=41, compact=True)


def get_filename(path_query: str, extension_file: str):
    list_filename = []
    path = os.path.join(path_query + 'queries' + '/')
    list_all = os.listdir(path)

    print(f'\nFound this queries in {path}')
    for query in list_all:
        if query.endswith(extension_file):
            list_filename.append(query)
            print(query)

    return list_filename


def cleansing_filename(*list_queries_name: list):
    list_filename_cleansing = []

    for query in list_queries_name:
        query = query.replace('.sql', '').lower()
        list_filename_cleansing.append(query)

    return list_filename_cleansing


def get_path_files(*list_queries_filename: str, path_queries: str):
    list_path_queries = []

    for query_filename in list_queries_filename:
        path_query = os.path.join(path_queries + 'queries' + '/' + query_filename)
        list_path_queries.append(path_query)
        print(path_query)

    return list_path_queries


def get_table_by_queries_file(list_queries_filename_cleansing: list, list_path_queries: list):
    dict_olap_dw = collections.defaultdict(list)

    for name, path_query in zip(list_queries_filename_cleansing, list_path_queries):
        list_table = []

        with open(path_query, mode='r', encoding='UTF8') as file_r:
            file = file_r.read()
            file = re.sub('[^A-Za-z0-9._ ]+', '', file)

            # .: matches any character except line breaks
            # $: end of string
            regex = '.+?(?=FULL|INNER|RIGHT|LEFT|TOP|NOLOCK|JOIN|WHERE|\s+|$)'
            pattern_from = "FROM" + regex
            pattern_join = "JOIN" + regex
            concatenate_pattern = pattern_join + '|' + pattern_from

            regex_query = re.findall(pattern=concatenate_pattern, string=str(file))

            for table in regex_query:
                list_table.append(table)

            # set contains tuple
            dict_olap_dw[name].append(set(list_table))

    return dict_olap_dw


def cleansing_queries_in_dict(dict_olap_dw: dict):
    dict_olap_dw_cleansing = collections.defaultdict(list)

    for key, list_table in dict_olap_dw.items():
        list_table = str(list_table).lower() \
            .replace('select', '') \
            .replace('DWH', 'dwh') \
            .replace('DBO', 'dbo') \
            .replace('STG', 'stg') \
            .replace('set().', '') \
            .replace('join ', '') \
            .replace('from', '') \
            .replace(' on', '') \
            .replace('{\'', '') \
            .replace('\'}', '') \
            .replace('[', '') \
            .replace(']', '') \
            .replace(' ', '') \
            .replace(',', ', ') \
            .replace('\'', '')

        dict_olap_dw_cleansing[key].append(list_table)

    #pp.pprint(dict_olap_dw_cleansing)
    return dict_olap_dw_cleansing


def get_columns_by_table_file(list_queries_filename_cleansing: list,
                              list_path_queries: list,
                              dict_olap_dw_cleansing: dict,
                              cnxn):
    dict_olap_dw = collections.defaultdict(list)

    for name, path_query, value in zip(list_queries_filename_cleansing,
                                       list_path_queries,
                                       dict_olap_dw_cleansing.values()):
            list_table = []
            print(name)
            print(path_query)
            print(value)

            with open(path_query, mode='r', encoding='UTF8') as file_r:
                file = file_r.read().lower()

                # ssas
                query = file.replace('select', 'select top 1 ') # optimize query
                local_where = query.find('where') # until where
                query = query[:local_where]
                df = pd.DataFrame(pd.read_sql(query, con=cnxn))
                columns = list(df.columns)
                #print(f'\nSSAS - {name}: {columns}')

                # dw
                if value[0] != 'set()':
                    df = pd.DataFrame(pd.read_sql(f'select top 1 * from {value[0]}', con=cnxn))
                    columns = list(df.columns)

                columns_clear = []
                for element in columns:
                    if element != 'DTCARGA' or element != 'dtcarga':
                        columns_clear.append(element)

                dict_olap_dw[name].append(columns_clear)
                #print(f'DWH - {value[0]}: {columns_clear}')

    return dict_olap_dw


def serialize_data(dict_olap_dw_cleansing: dict, name_project: str, path_src: str):
    path_storaged_dict = os.path.join(path_src + path_tmp + '/' + name_project + '.pickle')

    with open(path_storaged_dict, 'wb') as file:
        pickle.dump(dict_olap_dw_cleansing,
                    protocol=pickle.HIGHEST_PROTOCOL,
                    file=file)

    return pp.pprint(f'Dict storaged at: {path_storaged_dict}')


def main():
    cnxn = conn(sql_server=config.DATABASE_CONFIG['sql_server'],
                server=config.DATABASE_CONFIG['server'],
                database=config.DATABASE_CONFIG['database'],
                username=config.DATABASE_CONFIG['username'],
                password=config.DATABASE_CONFIG['password'])

    list_proj_name = get_proj_name(path=path_olap)
    list_path_proj = get_path_projects(path_olap=path_olap)

    for path, name_project in zip(list_path_proj, list_proj_name):
        list_queries_filename = get_filename(path_query=path,
                                             extension_file='.sql')

        list_queries_filename_cleansing = cleansing_filename(*list_queries_filename)
        list_path_queries = get_path_files(*list_queries_filename,
                                            path_queries=path)

        dict_olap_dw = get_table_by_queries_file(
            list_queries_filename_cleansing=list_queries_filename_cleansing,
            list_path_queries=list_path_queries)

        dict_olap_dw_cleansing = cleansing_queries_in_dict(dict_olap_dw=dict_olap_dw)
        pp.pprint(dict_olap_dw_cleansing)

        # tables
        serialize_data(dict_olap_dw_cleansing=dict_olap_dw_cleansing,
                       path_src=path_src,
                       name_project=name_project)

if __name__ == '__main__':
    main()
