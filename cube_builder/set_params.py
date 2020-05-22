import logging
import os
import sys

here = os.path.abspath(os.path.dirname(__file__))
path_outside = os.path.join(here + '/..')
sys.path.insert(1, path_outside)
import config
import utils.path

logging.basicConfig(level=logging.INFO,
                    format='%(asctime)s - %(levelname)s: %(message)s',
                    datefmt='%d-%b-%y %H:%M:%S')





import argparse
import json
import os
import pickle
import pprint
import re
import sys

here = os.path.abspath(os.path.dirname(__file__))
path_src = os.path.join(here + '/..')
sys.path.insert(1, path_src)
import config

pp = pprint.PrettyPrinter(indent=4)

here = os.path.abspath(os.path.dirname(__file__))
path_src = os.path.join(here + '/..')
path_tmp = config.PATHS['tmp']
path_dict = os.path.join(path_src + path_tmp)

path = os.path.join(here + '/../..')
path_analysis_services = config.PATHS['ssas']
absolute_olap_path = os.path.join(path + path_analysis_services)


def get_proj_name(path: str):
    """
    Get all projects OLAP
    :return:
        BI-UNJ-ArtefatoEvolucao
        BI-UNJ-Atendimento-Chamado
        BI-UNJ-Geral-Apontamento
        BI-UNJ-Manutenção-Chamado
        ...
    """
    list_olap_project_name = []
    list_files = os.listdir(path)

    print(f'\nSSAS project found:')
    for file in list_files:

        if file.endswith('OLAP') or file.startswith('BI'):
            list_olap_project_name.append(file)
            print(file)

    return list_olap_project_name


def get_path_proj(path: str, olap_project_name: str):
    """
    :return:
        ['C:\\Users\\bruno.moura\\projects\\bi-indicadores\\src\\set_ssas/../../olap/analysis_services/BI-UNJ/']
    """
    list_path_proj = []
    list_files = os.listdir(path)

    if olap_project_name in list_files:
        project_olap = os.path.join(path + olap_project_name + '/')
        list_path_proj.append(project_olap)
        print(f'\nPath of projects:\n{project_olap}')

    else:
        print(f'\nPath of projects:')
        for file in list_files:
            project_olap = os.path.join(path + file + '/')

            if file.endswith('OLAP') or file.startswith('BI'):
                list_path_proj.append(project_olap)
                print(project_olap)

    return list_path_proj


def get_path_bim(list_path_proj: list):
    """
    :return:
        ['C:\\Users\\bruno.moura\\projects\\bi-indicadores\\src\\set_ssas/../../olap/analysis_services/BI-UNJ/Chamados.bim']
    """
    list_path_bim = []

    for project in list_path_proj:
        list_files = os.listdir(project)

        for file in list_files:
            if file.endswith('.bim'):
                bim_path = os.path.join(project + file)
                list_path_bim.append(bim_path)
                print(f'\nBim files name:\n{file}')

    return list_path_bim


def get_path_pickle(path: str, name_project: str):
    """
    :return:
        ['C:/Users/bruno.moura/projects/bi-indicadores/src/set_ssas/../tmp/BI-UNJ.pickle',
        'C:/Users/bruno.moura/projects/bi-indicadores/src/set_ssas/../tmp/cols_BI-UNJ.pickle']
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


def open_bim_file_json(path_bim: str):
    with open(path_bim, mode='r', encoding='UTF8') as file:
        data = file.read()
        return json.loads(data)


def write_bim_file_json(bim_file: dict, path_bim: str):
    with open(path_bim, 'w', encoding='UTF8') as file:
        return json.dump(bim_file, file, ensure_ascii=False, indent=2)


def set_params(data: dict, dict_tables: dict, dict_cols: dict):
    """
    "name": "",
    "description": "",
    "columns": [...],
    "partitions": [...],
    "measures": [...],
    "annotations": [...]
    """
    print()
    print(79 * '*')
    print(f"Configuring parameters in {(data['model']['name'])}")
    print(79 * '*')

    for table in range(0, len(data['model']['tables'])):
        print(f"\n----- table = {table + 1} {data['model']['tables'][table]['name']} -----")

        # ----- TABLES: general params -----
        # description -> data lineage
        data['model']['tables'][table]['description'] = \
            dict_tables.get(data['model']['tables'][table]['name'].lower())

        # ----- TABLES: specific params -----
        if data['model']['tables'][table]['name'] \
                .startswith('dTempo'):
            data['model']['tables'][table]['dataCategory'] = 'Time'

        for col in range(0, len(data['model']['tables'][table]['columns'])):
            print(f"col = {col + 1} {(data['model']['tables'][table]['columns'][col]['name'])}")

            # ----- COLS: general params -----
            # summarizeBy -> none
            # formatString -> 0
            # dataType -> string
            # displayFolder -> Colunas
            # description -> data lineage
            data['model']['tables'][table]['columns'][col]['summarizeBy'] = 'none'
            data['model']['tables'][table]['columns'][col]['formatString'] = "0"
            data['model']['tables'][table]['columns'][col]['dataType'] = 'string'
            data['model']['tables'][table]['columns'][col]['displayFolder'] = 'Colunas'
            data['model']['tables'][table]['columns'][col]['description'] = \
                dict_tables.get(data['model']['tables'][table]['name'].lower())  # in production ...

            # ----- COLS ID: general params -----
            # isKey -> true
            # formatString -> 0
            # dataType -> int64
            # isHidden -> true
            # isNullable -> false
            if data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('ID'):
                data['model']['tables'][table]['columns'][col]['formatString'] = '#,0'
                data['model']['tables'][table]['columns'][col]['dataType'] = 'int64'
                data['model']['tables'][table]['columns'][col]['isHidden'] = 'true'
                data['model']['tables'][table]['columns'][col]['isNullable'] = 'false'
                data['model']['tables'][table]['columns'][col]['isKey'] = 'true'

                # ----- COLS ID: specific params -----
                if data['model']['tables'][table]['name'] \
                        .startswith('dTempo'):
                    data['model']['tables'][table]['columns'][col]['isKey'] = 'false'

                elif data['model']['tables'][table]['name'] \
                        .startswith('f'):
                    data['model']['tables'][table]['columns'][col]['isKey'] = 'false'

            # handler isKey in dTempo
            elif data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('Data'):
                table_name_concat = re.sub('Data', 'dTempo', data['model']['tables'][table]['name'])

                if table_name_concat == data['model']['tables'][table]['name']:
                    data['model']['tables'][table]['columns'][col]['isKey'] = 'true'

                if table_name_concat == data['model']['tables'][table]['name']:
                    data['model']['tables'][table]['columns'][col]['isKey'] = 'true'

                if data['model']['tables'][table]['columns'][col]['name'] \
                        .startswith('Data Início'):
                    data['model']['tables'][table]['columns'][col]['isKey'] = 'false'

                if data['model']['tables'][table]['columns'][col]['name'] \
                        .startswith('Data Fim'):
                    data['model']['tables'][table]['columns'][col]['isKey'] = 'false'

                if data['model']['tables'][table]['columns'][col]['name'] \
                        .startswith('Data Status'):
                    data['model']['tables'][table]['columns'][col]['isKey'] = 'false'

            # ------------------------------ END ------------------------------

            # ----- COLS: Date and Time -----
            if data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('Data'):
                data['model']['tables'][table]['columns'][col]['dataType'] = 'dateTime'
                data['model']['tables'][table]['columns'][col]['formatString'] = 'dd/MM/yyyy'

                if data['model']['tables'][table]['columns'][col]['name'] \
                        .startswith('Data e Horário'):
                    data['model']['tables'][table]['columns'][col]['dataType'] = 'dateTime'
                    data['model']['tables'][table]['columns'][col]['formatString'] = 'General Date'

            elif data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('IDHR'):
                data['model']['tables'][table]['columns'][col]['dataType'] = 'string'

            elif data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('DT'):
                data['model']['tables'][table]['columns'][col]['dataType'] = 'dateTime'
                data['model']['tables'][table]['columns'][col]['formatString'] = 'General Date'
                data['model']['tables'][table]['columns'][col]['isHidden'] = 'true'
            # ------------------------------ END ------------------------------

            # ----- COLS: dataCategory -----
            if data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('URL'):
                data['model']['tables'][table]['columns'][col]['dataType'] = 'string'
                data['model']['tables'][table]['columns'][col]['dataCategory'] = 'WebUrl'

            elif data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('Imagem'):
                data['model']['tables'][table]['columns'][col]['dataType'] = 'string'
                data['model']['tables'][table]['columns'][col]['dataCategory'] = 'ImageUrl'
            # ------------------------------ END ------------------------------

            # ----- Cols integer: specific -----
            if data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('Código Ano'):
                data['model']['tables'][table]['columns'][col]['dataType'] = 'int64'
                data['model']['tables'][table]['columns'][col]['formatString'] = '0'

            elif data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('Código Mês'):
                data['model']['tables'][table]['columns'][col]['dataType'] = 'int64'
                data['model']['tables'][table]['columns'][col]['formatString'] = '0'

            elif data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('Código Dia'):
                data['model']['tables'][table]['columns'][col]['dataType'] = 'int64'
                data['model']['tables'][table]['columns'][col]['formatString'] = '0'

            elif data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('Código Semana'):
                data['model']['tables'][table]['columns'][col]['dataType'] = 'int64'
                data['model']['tables'][table]['columns'][col]['formatString'] = '0'

            elif data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('idade'):
                data['model']['tables'][table]['columns'][col]['dataType'] = 'int64'
                data['model']['tables'][table]['columns'][col]['formatString'] = '#,0'

            elif data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('Binário'):
                data['model']['tables'][table]['columns'][col]['dataType'] = 'int64'
                data['model']['tables'][table]['columns'][col]['formatString'] = '#,0'

            elif data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('QT'):
                data['model']['tables'][table]['columns'][col]['dataType'] = 'int64'
                data['model']['tables'][table]['columns'][col]['formatString'] = '#,0'
                data['model']['tables'][table]['columns'][col]['isHidden'] = 'true'

            elif data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('Qt'):
                data['model']['tables'][table]['columns'][col]['dataType'] = 'int64'
                data['model']['tables'][table]['columns'][col]['formatString'] = '#,0'
                data['model']['tables'][table]['columns'][col]['isHidden'] = 'true'
            # ------------------------------ END ------------------------------

            # GAMBIARRA (decisões erradas feita no banco de dados e no ssas)
            if data['model']['tables'][table]['name'] \
                    .startswith('dEquipe'):

                if data['model']['tables'][table]['columns'][col]['name'] \
                        .startswith('IDUSUARIOHIST'):
                    data['model']['tables'][table]['columns'][col]['isKey'] = 'false'
                    data['model']['tables'][table]['columns'][col]['formatString'] = '#,0'
                    data['model']['tables'][table]['columns'][col]['dataType'] = 'int64'
                    data['model']['tables'][table]['columns'][col]['isHidden'] = 'true'
                    data['model']['tables'][table]['columns'][col]['isNullable'] = 'false'

                elif data['model']['tables'][table]['columns'][col]['name'] \
                        .startswith('IDDTAPURACAO'):  # dEquipeUsuarioExcel
                    data['model']['tables'][table]['columns'][col]['isKey'] = 'false'
                    data['model']['tables'][table]['columns'][col]['formatString'] = '#,0'
                    data['model']['tables'][table]['columns'][col]['dataType'] = 'int64'
                    data['model']['tables'][table]['columns'][col]['isHidden'] = 'true'
                    data['model']['tables'][table]['columns'][col]['isNullable'] = 'false'

            elif data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('IDDTAPURACAO Manipulado'):
                data['model']['tables'][table]['columns'][col]['dataType'] = 'string'
                data['model']['tables'][table]['columns'][col]['formatString'] = 'string'

            elif data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('Data Carga'):  # must measure
                data['model']['tables'][table]['columns'][col]['dataType'] = 'dateTime'
                data['model']['tables'][table]['columns'][col]['formatString'] = 'General Date'
                data['model']['tables'][table]['columns'][col]['isKey'] = 'false'
                data['model']['tables'][table]['columns'][col]['isHidden'] = 'true'

            elif data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('Semana'):
                data['model']['tables'][table]['columns'][col]['dataType'] = 'string'
                data['model']['tables'][table]['columns'][col]['formatString'] = 'string'

            elif data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('IDSISTEMA'):
                data['model']['tables'][table]['columns'][col]['isNullable'] = 'true'

            elif data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('Horas Apont'):  # cube: Apontamentos
                data['model']['tables'][table]['columns'][col]['dataType'] = 'double'
                data['model']['tables'][table]['columns'][col]['formatString'] = '#,0.00'

            elif data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('Minutos'):  # cube: Apontamentos
                data['model']['tables'][table]['columns'][col]['dataType'] = 'int64'
                data['model']['tables'][table]['columns'][col]['formatString'] = '#,0'

            elif data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('Flag Performace Encaminhada - origem'):  # cube: Apontamentos
                data['model']['tables'][table]['columns'][col]['dataType'] = 'int64'
                data['model']['tables'][table]['columns'][col]['formatString'] = '#,0'

            elif data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('Flag Performace - origem'):  # cube: Apontamentos
                data['model']['tables'][table]['columns'][col]['dataType'] = 'int64'
                data['model']['tables'][table]['columns'][col]['formatString'] = '#,0'
            # ------------------------------ END ------------------------------

            # ----- col: calculated -----
            if 'type' in data['model']['tables'][table]['columns'][col]:

                if data['model']['tables'][table]['columns'][col]['type'] \
                        .startswith('calculated'):
                    data['model']['tables'][table]['columns'][col]['formatString'] = '#,0'
                    data['model']['tables'][table]['columns'][col]['isKey'] = 'false'
                    data['model']['tables'][table]['columns'][col]['displayFolder'] = 'Medidas'
                    data['model']['tables'][table]['columns'][col]['description'] = \
                        data['model']['tables'][table]['columns'][col]['expression']

                    if data['model']['tables'][table]['columns'][col]['name'] \
                            .startswith('Data'):
                        data['model']['tables'][table]['columns'][col]['dataType'] = 'dateTime'
                        data['model']['tables'][table]['columns'][col]['formatString'] = 'dd/MM/yyyy'

                    elif data['model']['tables'][table]['columns'][col]['name'] \
                            .startswith('Data e Horário'):
                        data['model']['tables'][table]['columns'][col]['dataType'] = 'dateTime'
                        data['model']['tables'][table]['columns'][col]['formatString'] = 'General Date'

                    elif data['model']['tables'][table]['columns'][col]['name'] \
                            .startswith('Média'):
                        data['model']['tables'][table]['columns'][col]['dataType'] = 'int64'
                        data['model']['tables'][table]['columns'][col]['formatString'] = '#,0.00'

                    elif data['model']['tables'][table]['columns'][col]['name'] \
                            .startswith('Idade'):
                        data['model']['tables'][table]['columns'][col]['dataType'] = 'int64'
                        data['model']['tables'][table]['columns'][col]['formatString'] = '#,0'

                    elif data['model']['tables'][table]['columns'][col]['name'] \
                            .startswith('Ano ID'):
                        data['model']['tables'][table]['columns'][col]['dataType'] = 'int64'
                        data['model']['tables'][table]['columns'][col]['formatString'] = '0'

                    elif data['model']['tables'][table]['columns'][col]['name'] \
                            .startswith('Mês ID'):
                        data['model']['tables'][table]['columns'][col]['dataType'] = 'int64'
                        data['model']['tables'][table]['columns'][col]['formatString'] = '0'

                    # ------------------------------ END ------------------------------

        # ----- measures -----
        if 'measures' in data['model']['tables'][table]:

            for measure_number in range(0, len(data['model']['tables'][table]['measures'])):
                print(f"measure = {measure_number + 1} "
                      f"{(data['model']['tables'][table]['measures'][measure_number]['name'])}")

                # general configs
                data['model']['tables'][table]['measures'][measure_number]['formatString'] = '#,0'
                data['model']['tables'][table]['measures'][measure_number]['dataType'] = 'int64'
                data['model']['tables'][table]['measures'][measure_number]['displayFolder'] = 'Medidas'
                data['model']['tables'][table]['measures'][measure_number]['description'] = \
                data['model']['tables'][table]['measures'][measure_number]['expression']

                # specific configs
                if (data['model']['tables'][table]['measures'][measure_number]['name']) \
                        .startswith('Data'):
                    data['model']['tables'][table]['measures'][measure_number]['dataType'] = 'dateTime'
                    data['model']['tables'][table]['measures'][measure_number]['formatString'] = 'dd/MM/yyyy'

                    if (data['model']['tables'][table]['measures'][measure_number]['name']) \
                            .startswith('Data e Horário'):
                        data['model']['tables'][table]['measures'][measure_number]['dataType'] = 'dateTime'
                        data['model']['tables'][table]['measures'][measure_number]['formatString'] = 'General Date'

                if data['model']['tables'][table]['measures'][measure_number]['name'] \
                        .startswith('Ano'):
                    data['model']['tables'][table]['measures'][measure_number]['dataType'] = 'int64'
                    data['model']['tables'][table]['measures'][measure_number]['formatString'] = '0'

                if data['model']['tables'][table]['measures'][measure_number]['name'] \
                        .startswith('Meses'):
                    data['model']['tables'][table]['measures'][measure_number]['dataType'] = 'string'
                    data['model']['tables'][table]['measures'][measure_number]['formatString'] = '#,0'

                if data['model']['tables'][table]['measures'][measure_number]['name'] \
                        .startswith('Código Mês'):
                    data['model']['tables'][table]['measures'][measure_number]['dataType'] = 'int64'
                    data['model']['tables'][table]['measures'][measure_number]['formatString'] = '0'

                if data['model']['tables'][table]['measures'][measure_number]['name'] \
                        .startswith('Código Dia'):
                    data['model']['tables'][table]['measures'][measure_number]['dataType'] = 'int64'
                    data['model']['tables'][table]['measures'][measure_number]['formatString'] = '0'

                elif data['model']['tables'][table]['measures'][measure_number]['name'] \
                        .startswith('Soma'):
                    data['model']['tables'][table]['measures'][measure_number]['dataType'] = 'int64'
                    data['model']['tables'][table]['measures'][measure_number]['formatString'] = '#,0'

                elif data['model']['tables'][table]['measures'][measure_number]['name'] \
                        .startswith('Média'):
                    data['model']['tables'][table]['measures'][measure_number]['dataType'] = 'int64'
                    data['model']['tables'][table]['measures'][measure_number]['formatString'] = '#,0.00'

                elif data['model']['tables'][table]['measures'][measure_number]['name'] \
                        .startswith('Contagem Distinta'):
                    data['model']['tables'][table]['measures'][measure_number]['dataType'] = 'int64'
                    data['model']['tables'][table]['measures'][measure_number]['formatString'] = '#,0'

                elif data['model']['tables'][table]['measures'][measure_number]['name'] \
                        .startswith('Total'):
                    data['model']['tables'][table]['measures'][measure_number]['dataType'] = 'int64'
                    data['model']['tables'][table]['measures'][measure_number]['formatString'] = '#,0'

                elif data['model']['tables'][table]['measures'][measure_number]['name'] \
                        .startswith('Qtde'):
                    data['model']['tables'][table]['measures'][measure_number]['dataType'] = 'int64'
                    data['model']['tables'][table]['measures'][measure_number]['formatString'] = '#,0'

                elif data['model']['tables'][table]['measures'][measure_number]['name'] \
                        .startswith('Aux Horas Apontadas'):
                    data['model']['tables'][table]['measures'][measure_number]['dataType'] = 'double'
                    data['model']['tables'][table]['measures'][measure_number]['formatString'] = '#,0.00'

                elif data['model']['tables'][table]['measures'][measure_number]['name'] \
                        .startswith('Título - Seleção Cliente'):
                    data['model']['tables'][table]['measures'][measure_number]['dataType'] = 'string'
                    data['model']['tables'][table]['measures'][measure_number]['formatString'] = 'string'

                elif data['model']['tables'][table]['measures'][measure_number]['name'] \
                        .startswith('Produtividade'):
                    data['model']['tables'][table]['measures'][measure_number]['dataType'] = 'double'
                    data['model']['tables'][table]['measures'][measure_number]['formatString'] = '#,0.00'

                elif data['model']['tables'][table]['measures'][measure_number]['name'] \
                        .startswith('Período Atual'):
                    data['model']['tables'][table]['measures'][measure_number]['dataType'] = 'string'
                    data['model']['tables'][table]['measures'][measure_number]['formatString'] = 'string'

                elif data['model']['tables'][table]['measures'][measure_number]['name'] \
                        .startswith('SLA'):
                    data['model']['tables'][table]['measures'][measure_number]['dataType'] = 'int64'
                    data['model']['tables'][table]['measures'][measure_number]['formatString'] = '0.00%;-0.00%;0.00%'

                elif data['model']['tables'][table]['measures'][measure_number]['name'] \
                        .startswith('IAD'):
                    data['model']['tables'][table]['measures'][measure_number]['dataType'] = 'int64'
                    data['model']['tables'][table]['measures'][measure_number]['formatString'] = '#,0.00'

    return data


def open_bim_file(path_bim: str):
    with open(path_bim, mode='r', encoding='UTF8') as file:
        return file.read()


def write_changes_bim(bim_stream: str, path_bim: str):
    data = re.sub(pattern='"true"', repl=r'true', string=str(bim_stream))
    data = re.sub(pattern='"false"', repl=r'false', string=str(data))

    with open(path_bim, mode='w+', encoding='UTF8') as file_w:
        file_w.write(data)


def main(olap_project_name: str):
    list_proj_name = get_proj_name(path=absolute_olap_path)
    list_path_proj = get_path_proj(olap_project_name=olap_project_name,
                                   path=absolute_olap_path)
    list_path_bim = get_path_bim(list_path_proj=list_path_proj)

    for name_project in list_proj_name:

        if name_project == olap_project_name:
            list_path_dict_data_lineage = get_path_pickle(path=path_dict, name_project=name_project)
            print(list_proj_name)

            # open dict data lineage of tables and columns
            dict_cols = dict()
            dict_tables = dict()

            for path_dict_data_lineage in list_path_dict_data_lineage:

                if ('cols_' + name_project + '.') in path_dict_data_lineage:
                    print('\n\nGraph of cols (data lineage)')
                    graph_cols = open_dict_map(path_dict=path_dict_data_lineage)
                    dict_cols = graph_cols
                    pp.pprint(dict_cols)

                else:
                    print('\n\nGraph of tables (data lineage)')
                    graph_tables = open_dict_map(path_dict=path_dict_data_lineage)
                    dict_tables = graph_tables
                    pp.pprint(dict_tables)

            for path_bim in list_path_bim:
                bim_file = open_bim_file_json(path_bim=path_bim)
                data = set_params(data=bim_file,
                                  dict_tables=dict_tables,
                                  dict_cols=dict_cols)

                write_bim_file_json(bim_file=data, path_bim=path_bim)
                data = open_bim_file(path_bim=path_bim)
                write_changes_bim(bim_stream=data, path_bim=path_bim)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Get queries in SSAS')
    parser.add_argument('--olap_project_name',
                        type=str,
                        required=True,
                        default='all',
                        help='Directory where is bim file.'
                             'If all projects OLAP, so --olap_project_name all'
                             'E.g: BI-UNJ-Indicadores')

    args = parser.parse_args()  # <class 'argparse.ArgumentParser'>
    olap_project_name = args.olap_project_name

    main(olap_project_name=olap_project_name)
