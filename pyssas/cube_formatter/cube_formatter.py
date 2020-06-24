import argparse
import os
import sys

from pyssas.cube_formatter.set_params import *

import config
from utils.files import *

here = os.path.abspath(os.path.dirname(__file__))
path_outside = os.path.join(here + '/..')
sys.path.insert(1, path_outside)

# Genaral
folder_columns = config.CUBE_GENERAL_CONFIG['folder_columns']
folder_measures = config.CUBE_GENERAL_CONFIG['folder_measures']
folder_calculated_columns = config.CUBE_GENERAL_CONFIG['folder_calculated_columns']
summarize = config.CUBE_GENERAL_CONFIG['summarize']

# PK
list_cols_exceptions = config.EXCEPTIONS_PK_CONFIG['list_cols_exceptions']
list_tables_exceptions = config.EXCEPTIONS_PK_CONFIG['list_tables_exceptions']


def main(path_olap: str):
    list_path_proj = get_path_projects(path_olap=path_olap)
    list_path_bim = get_path_bim(list_path_proj=list_path_proj)

    for path_bim in list_path_bim:
        bim_file = open_bim_file_json(path_bim=path_bim)
        data = set_general_params(data=bim_file,
                                  folder_columns=folder_columns,
                                  folder_calculated_columns=folder_calculated_columns,
                                  folder_measures=folder_measures,
                                  summarize=summarize)

        data = set_pk_params(data=bim_file,
                             list_table_exceptions=list_tables_exceptions,
                             list_col_exceptions=list_cols_exceptions)

        write_bim_file_json(bim_file=data, path_bim=path_bim)
        data = open_bim_file(path_bim=path_bim)
        write_changes_bim(bim_stream=data, path_bim=path_bim)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Get metadata in cube')
    parser.add_argument('--path_olap',
                        type=str,
                        required=True,
                        default='all',
                        help='Path where is bim file.'
                             ' E.g: $Env:home\\analysis-services-features\\examples')

    args = parser.parse_args()  # <class 'argparse.ArgumentParser'>
    path_olap = args.path_olap

    main(path_olap=path_olap)
