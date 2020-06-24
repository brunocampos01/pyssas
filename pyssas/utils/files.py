import json
import os
import pickle
import re
import sys
from pathlib import Path


def get_path_projects(path_olap: str):
    """
    :return:
    ['$HOME\\projects\\automate-ssas-build\\examples/bi-project_name-olap',
     'C:\\Users\\Env:USER\\projects\\automate-ssas-build\\examples/bi-TWO-olap']
    """
    list_path_proj = []
    list_files = os.listdir(path_olap)

    print(f'Projects OLAP found:')
    for file in list_files:
        project_olap = os.path.join(path_olap + '/' + file).lower()

        if file.endswith('olap') or file.endswith('olap') \
           or file.startswith('bi') or file.endswith('bi') \
           or file.startswith('tabular') or file.endswith('tabular') \
           or file.startswith('ssas') or file.endswith('ssas'):
            list_path_proj.append(project_olap)
            print(project_olap)
            
    if './pyssas' in list_path_proj:
        list_path_proj.clear()        
        print(list_path_proj)

        if len(list_path_proj) == 0:
            print(
                """
                ************************************************************************************
                !!! OLAP project NOT FOUND !!!\n
                Check if is executing in folder what contains files .bim
                Folder with SSAS project must start or end with: olap or bi or ssas\n
                ************************************************************************************
                """)
            return sys.exit()

    return list_path_proj


def get_proj_name(path: str):
    """
    :return:
        bi-project_name-olap, bi-two-olap
    """
    list_olap_name = []
    list_files = os.listdir(path)

    print(f'\nSSAS project found:')
    for file in list_files:
        file = file.lower()


        if file.endswith('olap') or file.endswith('olap') \
           or file.startswith('bi') or file.endswith('bi') \
           or file.startswith('tabular') or file.endswith('tabular') \
           or file.startswith('ssas') or file.endswith('ssas'):
            list_olap_name.append(file)
            print(file)

    return list_olap_name


def get_path_bim(list_path_proj: list):
    """
    :return:
    C:\\Users\\$Env:USER\\projects\\automate-ssas-build\\examples/bi-project_name-olap/ssas_data_base_name.bim
    C:\\Users\\$Env:USER\\projects\\automate-ssas-build\\examples/bi-TWO-olap/ssas_data_base_name.bim
    """
    list_path_bim = []

    print(f'\nBim file found:')
    for project in list_path_proj:
        list_files = os.listdir(project)

        for file in list_files:
            if file.endswith('.bim'):
                bim_path = os.path.join(project + '/' + file)
                list_path_bim.append(bim_path)
                print(bim_path)

    return list_path_bim


def create_directory(list_path_proj: list, dir_name: str):
    """
    :return:
    Directory created at
    c:\\users\\$Env:USER\\projects\\automate-ssas-build\\examples/bi-project_name-olap/queries/
    c:\\users\\$Env:USER\\projects\\automate-ssas-build\\examples/bi-two-olap/queries/
    """
    list_path_proj_with_dir = []

    print(f'\nDirectory created at')
    for path_olap in list_path_proj:
        dir = os.path.join(path_olap + dir_name)
        Path(dir).mkdir(parents=True, exist_ok=True)
        list_path_proj_with_dir.append(dir)
        print(dir)

    return list_path_proj_with_dir


def open_dict_map(path_dict: str):
    with open(path_dict, mode='rb') as file:
        return pickle.load(file)


def open_bim_file_json(path_bim: str):
    with open(path_bim, mode='r', encoding='UTF8') as file:
        data = file.read()
        return json.loads(data)


def write_bim_file_json(bim_file: dict, path_bim: str):
    with open(path_bim, 'w', encoding='UTF8') as file:
        return json.dump(bim_file, file, ensure_ascii=False, indent=2)


def open_bim_file(path_bim: str):
    with open(path_bim, mode='r', encoding='UTF8') as file:
        return file.read()


def write_changes_bim(bim_stream: str, path_bim: str):
    data = re.sub(pattern='"true"', repl=r'true', string=str(bim_stream))
    data = re.sub(pattern='"false"', repl=r'false', string=str(data))

    with open(path_bim, mode='w+', encoding='UTF8') as file_w:
        file_w.write(data)


def get_path_pickle(path: str, name_project: str):
    """
    :return:
        ['C:/Users/$Env:USER/projects/bi-indicadores/src/set_ssas/../tmp/BI-UNJ.pickle',
        'C:/Users/$Env:USER/projects/bi-indicadores/src/set_ssas/../tmp/cols_BI-UNJ.pickle']
    """

    list_path_dict = []
    list_files = os.listdir(path)
    dict_table = name_project + '.pickle'
    dict_col = 'cols_' + name_project + '.pickle'

    print(f'\nDictionary of data lineage found:')
    for file in list_files:

        if file == dict_table or file == dict_col:
            dict_path = os.path.join(path + file)
            list_path_dict.append(dict_path)
            print(file)

    return list_path_dict


def open_dict_map(path_dict: str):
    with open(path_dict, mode='rb') as file:
        return pickle.load(file)


def create_dax_file(list_elements: list, list_name_elements: list,
                    path_to_storage: str, name_file: str):
    path = os.path.join(path_to_storage + name_file)

    with open(path, mode='w', encoding='UTF8') as file_w:
        for name_element, elements_bim in zip(list_name_elements, list_elements):
            with open(path, mode='a', encoding='UTF8') as file_w:
                str_file = (str(elements_bim) \
                            .replace("[' ', '    ", '') \
                            .replace("['', '", '') \
                            .replace("']", '') \
                            .replace(",\"", ', \"') \
                            .replace(",', '", ';\n') \
                            .replace(", ', '", ';\n') \
                            .replace(']==', '] ==') \
                            .replace("[' ", '') \
                            .replace("', '", '')
                            .replace("', '", '') \
                            .replace("(        ", '(') \
                            .replace("[' ", '') \
                            .replace(", 1", '\t\n, 1 \n') \
                            .replace(' & "/" &', '\n\t& "/" &\n') \
                            .replace(")<=", ') <= ') \
                            .replace('\\t', '') \
                            .replace('if', 'IF') \
                            .replace('If', 'IF') \
                            .replace('IF ', 'IF') \
                            .replace('\t\t\t\t\t\t\t\t\t\t\t\t', '')
                            )

                str_file = re.sub(r"^ ", "",
                                  str_file,
                                  flags=re.MULTILINE)  # remove white space in start line
                str_file = re.sub(r" ,\s", "",
                                  str_file,
                                  flags=re.MULTILINE)  # remove comma in final element
                file_w.write(name_element)
                file_w.write(' :=\n\t')
                file_w.write(str_file)
                file_w.write('\n\n\n')


def create_queries_file(list_queries: list, list_name_queries: list,
                        path_to_storage: str, name_file: str):
    path = os.path.join(path_to_storage + name_file)

    with open(path, mode='w', encoding='UTF8') as file_w:
        for name_query, query in zip(list_name_queries, list_queries):
                str_file = (str(query) \
                            .replace('DWH', 'dwh') \
                            .replace('DBO', 'dbo') \
                            .replace('STG', 'stg') \
                            .replace('select ', 'SELECT') \
                            .replace('from', '\nFROM') \
                            .replace('FROM', '\nFROM') \
                            .replace('where', '\nWHERE') \
                            .replace('WHERE', '\nWHERE') \
                            .replace('order by', '\nORDER BY') \
                            .replace('group by', '\nGROUP BY') \
                            .replace('and ', ' AND ') \
                            .replace(' as ', ' AS ') \
                            .replace('AS ', ' AS ') \
                            .replace('cast ( ', 'CAST(') \
                            .replace('sum', 'SUM') \
                            .replace('convert ( ', 'CONVERT(') \
                            .replace('then', 'THEN') \
                            .replace('case', 'CASE') \
                            .replace('when', 'WHEN') \
                            .replace('else', 'ELSE') \
                            .replace('all', 'ALL ') \
                            .replace('ALL', 'ALL\n') \
                            .replace('UNION', '\n\tUNION') \
                            .replace('convert ( ', 'CONVERT(') \
                            .replace('join', 'JOIN') \
                            .replace('left outer', 'LEFT OUTER') \
                            .replace('current', 'CURRENT') \
                            .replace('timestamp', 'TIMESTAMP') \
                            .replace('left outer', 'LEFT OUTER')\
                            .replace('timestamp', 'TIMESTAMP') \
                            .replace('  ', '') \
                            .replace('1\'', ' 1 ') \
                            .replace('[\'', '') \
                            .replace('\']', '') \
                            .replace('"', '') \
                            .replace('\\t', ', ') \
                            .replace(', \'', '') \
                            .replace('"', '') \
                            .replace(',\',', ',') \
                            .replace(',  AS', ' AS') \
                            .replace('1AS', '1 AS') \
                            .replace(',  AS', ' AS') \
                            .replace(',  AS', ' AS') \
                            .replace(',,AS', ' AS') \
                            .replace(', AS', ' AS') \
                            .replace(', , ', ',') \
                            .replace(',,', ', ') \
                            .replace(',,', ', ') \
                            .replace('  ', ' ') \
                            .replace(', AS', ' AS') \
                            .replace('SELECT ', 'SELECT\n\t') \
                            .replace('	 \' ', '	 ') \
                            .replace('	 \'', '	 ') \
                            .replace('	 , ', '	 ') \
                            .replace(', ', ',') \
                            .replace(',', ',\n\t') \
                            .replace('AS\'', 'AS \'') \
                            .replace('	,', '') \
                            .replace('	,', '') \
                            .replace("DTCARGA\'", 'DTCARGA') \
                            .replace("FROM ,'", 'FROM') \
                            .replace("SELECT',", 'SELECT') \
                            .replace("FROM,", 'FROM') \
                            .replace('"', '')) # tree comma

                # apply regex
                str_file = re.sub(r"\t  '", "",
                                  str_file,
                                  flags=re.MULTILINE)
                str_file = re.sub(r",\n	 AS", " AS",
                                  str_file,
                                  flags=re.MULTILINE)
                str_file = re.sub(r"\t'", "\n",
                                  str_file,
                                  flags=re.MULTILINE)
                str_file = re.sub(r"\n\n", "\n",
                                  str_file,
                                  flags=re.MULTILINE)
                str_file = re.sub(r"\n'", "\n",
                                  str_file,
                                  flags=re.MULTILINE)
                str_file = re.sub(r"\n ", "\n",
                                  str_file,
                                  flags=re.MULTILINE)
                str_file = re.sub(r",\n", ",\n",
                                  str_file,
                                  flags=re.MULTILINE)
                str_file = re.sub(r"'\nWHERE", "\nWHERE ",
                                  str_file,
                                  flags=re.MULTILINE)
                # str_file = re.sub(r".\',", "",
                #                   str_file,
                #                   flags=re.MULTILINE)
                str_file = re.sub(r"\n,", "",
                                  str_file,
                                  flags=re.MULTILINE)
                str_file = re.sub(r",, ", ", ",
                                  str_file,
                                  flags=re.MULTILINE)
                file_w.write('-' * 79)
                file_w.write(f'\n-- Partition: {name_query}\n')
                file_w.write(str_file)
                file_w.write('\n\n')
