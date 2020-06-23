import os
import re

here = os.path.dirname(os.path.abspath(__file__))
path_ssis = '/etl/ssis/'
path = os.path.join(here + '/../..' + path_ssis)
path_queries_ssis = os.path.join(path + 'queries/')

print(path)


def get_pck_name(path_pck: str):
    list_pck = []
    list_all_pck = os.listdir(path_pck)

    for pck in list_all_pck:
        pck = pck.lower()
        if pck.endswith('.dtsx'):
            list_pck.append(pck)

    return list_pck


def file_cleansing(path: str, *list_pck):
    list_pck_cleansing = []

    for pck in list_pck:
        path_pck = os.path.join(path + pck)
        # print(path_pck)

        with open(path_pck, mode='r', encoding='UTF8') as file:
            data = file.read()
            data = data.replace('\s', '') \
                .replace('\\t', ' ') \
                .replace('\r', '') \
                .replace('\n', '') \
                .replace('"', '') \
                .replace('>', '>') \
                .replace('<', '') \
                .replace('[', 'XX') \
                .replace(']', 'XXX')
            list_pck_cleansing.append(data)

    return list_pck_cleansing


def get_col_name(*list_pck_cleansing: list, direction: str):
    """sample:
        <outputColumn
        refId="Package\DTF Carga Tabela SCCD10_MAXIMO_TICKET\ADO_SRC
         - SCCD10_MAXIMO_TICKET.Outputs[Saída de Erro de Origem do ADO NET].Columns[dtcarga]"
        dataType="dbTimeStamp"
        lineageId="Package\DTF Carga Tabela SCCD10_MAXIMO_TICKET\ADO_SRC -
        SCCD10_MAXIMO_TICKET.Outputs[Saída de Erro de Origem do ADO NET].Columns[dtcarga]"
        name="dtcarga" />
    """
    regex = '.+?(?=/>)' # end xml tag
    pattern = direction + "Column" + regex

    regex_col_name = '.+?(?=XXX)'
    pattern_col_name = "XX.Columns" + regex_col_name

    list_cols_name = []

    for pck in list_pck_cleansing:
        pck = re.findall(pattern=pattern, string=str(pck))
        cols_pck = re.findall(pattern=pattern_col_name, string=str(pck))
        list_cols_name.append(cols_pck)

    return list_cols_name


def cleansing_cols_name(*list_cols_name: list):
    list_cols_formated = []

    for col in list_cols_name:
        col = str(col).replace('XX.ColumnsXX', '')
        list_cols_formated.append(col)

    # print(list_cols_formated)
    # print(len(list_cols_formated))

    return list_cols_formated


def map_col(list_pck: list, list_queries_formated_input: list, list_queries_formated_output: list):
    for pck, input, output in zip(list_pck, list_queries_formated_input, list_queries_formated_output):
        print('\n')
        print(pck)

        print('INPUT')
        print(len(input))
        print(input)

        print('\nOUTPUT')
        print(output)
        print(len(output))



def main():
    list_pck_name = get_pck_name(path_pck=path)
    list_pck_cleansing = file_cleansing(path, *list_pck_name)

    list_cols_name_input = get_col_name(*list_pck_cleansing, direction='input')
    list_queries_formated_input = cleansing_cols_name(*list_cols_name_input)
    list_cols_name_output = get_col_name(*list_pck_cleansing, direction='output')
    list_queries_formated_output = cleansing_cols_name(*list_cols_name_output)
    map_col(list_pck_name, list_queries_formated_input, list_queries_formated_output)


if __name__ == '__main__':
    main()