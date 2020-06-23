import collections
import os
import pickle
import re
import sys
import pprint

here = os.path.abspath(os.path.dirname(__file__))
path_src = os.path.join(here + '/..')
sys.path.insert(1, path_src)
import config

path = os.path.join(here + '/../..')
path_analysis_services = config.PATHS['ssas']
path_tmp = config.PATHS['tmp']
relative_olap_path = os.path.join(path + path_analysis_services)

here = os.path.dirname(os.path.abspath(__file__))
path = os.path.join(here + '/../..')
path_dw = os.path.join(path + '/data_base/stored_procedures/')

pp = pprint.PrettyPrinter(width=41, compact=True)


def get_filename(path_sp: str, extension_file: str):
    list_filename = []
    list_all = os.listdir(path_sp)

    for sp in list_all:
        sp = sp.lower()
        if sp.endswith(extension_file):
            list_filename.append(sp)

    return list_filename


def cleansing_filename(*list_sp_name: list):
    list_filename_cleansing = []

    for sp in list_sp_name:
        sp = sp.replace('spcarga_', '').replace('.sql', '')
        list_filename_cleansing.append(sp)

    return list_filename_cleansing


def get_path_files(*list_queries_filename: str, path_queries: str):
    list_path_queries = []

    for query_filename in list_queries_filename:
        path_query = os.path.join(path_queries + query_filename)
        list_path_queries.append(path_query)

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
            regex = '.+?(?=FULL|INNER|RIGHT|LEFT|NOLOCK|JOIN|WHERE|\s+|;|$)'
            pattern_from = "FROM" + regex
            pattern_join = "JOIN" + regex
            concatenate_pattern = pattern_join + '|' + pattern_from

            regex_query = re.findall(pattern=concatenate_pattern, string=str(file))

            for table in regex_query:
                list_table.append(table)

            # set contains tuple
            dict_olap_dw[name].append(set(list_table))

    return dict_olap_dw


def cleansing_queries(dict_dw_stg: dict):
    dict_dw_stg_cleansing = collections.defaultdict(list)

    for key, list_table in dict_dw_stg.items():
        list_table = str(list_table).lower() \
            .replace('select', '') \
            .replace('dbo.', '') \
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
        dict_dw_stg_cleansing[key].append(list_table)

    pp.pprint(dict_dw_stg_cleansing)

    return dict_dw_stg_cleansing


def serialize_data(dict_dw_stg_cleansing: dict):
    path_storage_dict = os.path.join(here + '/dict_dw_stg.pickle')

    with open(path_storage_dict, 'wb') as file:
        pickle.dump(dict_dw_stg_cleansing,
                    protocol=pickle.HIGHEST_PROTOCOL,
                    file=file)

    return pp.pprint(f'Dict storage at: {path_storage_dict}')


def main():
    list_sp_filename = get_filename(path_sp=path_dw, extension_file='.sql')
    list_sp_name_cleansing = cleansing_filename(*list_sp_filename)

    list_path_queries = get_path_files(*list_sp_filename,
                                       path_queries=path_dw)
    dict_dw_stg = get_table_by_queries_file(
        list_queries_filename_cleansing=list_sp_name_cleansing,
        list_path_queries=list_path_queries)

    dict_olap_dw_cleansing = cleansing_queries(dict_dw_stg=dict_dw_stg)
    serialize_data(dict_dw_stg_cleansing=dict_olap_dw_cleansing)


if __name__ == '__main__':
    main()