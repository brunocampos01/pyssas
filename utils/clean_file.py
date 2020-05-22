import re


def clean_file(path_bim: str, dict_clean: dict):
    with open(path_bim, mode='r', encoding='UTF8') as file:
        data = file.read()

        for i, j in dict_clean.items():
            data = data.replace(i, j)

        print('Cleansing complete.')
        return re.sub(' +', ' ', data)  # remove 2 or more spaces
