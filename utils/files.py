import json
import os
import pickle
import re
from pathlib import Path


def get_path_projects(path_olap: str):
    """
    :return:
    ['C:\\Users\\bruno.moura\\projects\\automate-ssas-build\\examples/bi-project_name-olap',
     'C:\\Users\\bruno.moura\\projects\\automate-ssas-build\\examples/bi-TWO-olap']
    """
    list_path_proj = []
    list_files = os.listdir(path_olap)

    print(f'\nProjects OLAP found:')
    for file in list_files:
        project_olap = os.path.join(path_olap + '/' + file).lower()

        if file.endswith('olap') or file.startswith('bi') or file.startswith('ssas') or file.endswith('ssas'):
            list_path_proj.append(project_olap)
            print(project_olap)

    return list_path_proj


def get_path_bim(list_path_proj: list):
    """
    :return:
    C:\\Users\\bruno.moura\\projects\\automate-ssas-build\\examples/bi-project_name-olap/ssas_data_base_name.bim
    C:\\Users\\bruno.moura\\projects\\automate-ssas-build\\examples/bi-TWO-olap/ssas_data_base_name.bim
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


def get_proj_name(path: str):
    """
    :return:
        ssas_data_base_name, ...
    """
    list_olap_name = []
    list_files = os.listdir(path)

    print(f'\nSSAS project found:')
    for file in list_files:

        if file.endswith('OLAP') or file.startswith('BI'):
            list_olap_name.append(file)
            print(file)

    return list_olap_name


def create_directory(list_path_proj: list, dir_name: str):
    """
    :return:
    Directory created at
    c:\\users\\bruno.moura\\projects\\automate-ssas-build\\examples/bi-project_name-olap/queries/
    c:\\users\\bruno.moura\\projects\\automate-ssas-build\\examples/bi-two-olap/queries/
    """
    list_path_proj_with_dir = []

    print(f'\nDirectory created at')
    for path_olap in list_path_proj:
        dir = os.path.join(path_olap + dir_name)
        Path(dir).mkdir(parents=True, exist_ok=True)
        list_path_proj_with_dir.append(dir)
        print(dir)

    return list_path_proj_with_dir


def open_bim_file_json(path_bim: str):
    with open(path_bim, mode='r', encoding='UTF8') as file:
        data = file.read()
        return json.loads(data)


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
                            .replace(", 1", '\t\n, 1\n') \
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
                            .replace('select ', 'SELECT\n') \
                            .replace('SELECT\'', 'SELECT ') \
                            .replace('SELECT ', 'SELECT\n\t') \
                            .replace('SELECT\n\t,', 'SELECT') \
                            .replace('SELECT \'', 'SELECT\n\t') \
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
                            .replace('1\'', '1') \
                            .replace('[\'', '') \
                            .replace('\']', '') \
                            .replace('"', '') \
                            .replace('\\t', ', ') \
                            .replace(',,', ',')
                            .replace(', \'', '') \
                            .replace('"', '') \
                            .replace(',\',', ',') \
                            .replace(', , ', ',') \
                            .replace(',', ',\n') \
                            .replace('"', ''))

                # apply regex
                str_file = re.sub(r"\t  '", "",
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
                str_file = re.sub(r"SELECT\n", "SELECT\n",
                                  str_file,
                                  flags=re.MULTILINE)
                str_file = re.sub(r"'\nWHERE", "\nWHERE ",
                                  str_file,
                                  flags=re.MULTILINE)
                str_file = re.sub(r"FROM", "FROM ",
                                  str_file,
                                  flags=re.MULTILINE)
                str_file = re.sub(r"\n,", "",
                                  str_file,
                                  flags=re.MULTILINE)
                file_w.write('-' * 79)
                file_w.write(f'\n-- Partition: {name_query}\n')
                file_w.write(str_file)
                file_w.write('\n\n')
