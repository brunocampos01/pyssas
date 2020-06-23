import argparse
import os
import sys

here = os.path.abspath(os.path.dirname(__file__))
path_outside = os.path.join(here + '/..')
sys.path.insert(1, path_outside)
from utils.files import *
from get_params import *


def main(path_olap: str):
    list_path_proj = get_path_projects(path_olap=path_olap)
    list_path_bim = get_path_bim(list_path_proj=list_path_proj)
    list_path_measure = create_directory(list_path_proj=list_path_proj,
                                         dir_name='/measures/')
    list_path_calculated_cols = create_directory(list_path_proj=list_path_proj,
                                                 dir_name='/calculated_cols/')
    list_path_queries = create_directory(list_path_proj=list_path_proj,
                                         dir_name='/queries/')

    for path_bim, path_measure, path_calculated_cols, path_queries in zip(list_path_bim,
                                                                          list_path_measure,
                                                                          list_path_calculated_cols,
                                                                          list_path_queries):
        bim_file = open_bim_file_json(path_bim=path_bim)
        list_measures, \
        list_measures_name = get_measures(data=bim_file)
        list_calculated_col, \
        list_name_calculated_col = get_calculated_col(data=bim_file)
        list_queries, \
        list_name_queries = get_queries(data=bim_file)

        create_dax_file(list_elements=list_measures,
                        list_name_elements=list_measures_name,
                        path_to_storage=path_measure,
                        name_file='measures.dax')
        create_dax_file(list_elements=list_calculated_col,
                        list_name_elements=list_name_calculated_col,
                        path_to_storage=path_calculated_cols,
                        name_file='calculated_columns.dax')
        create_queries_file(list_queries=list_queries,
                        list_name_queries=list_name_queries,
                        path_to_storage=path_queries,
                        name_file='queries.sql')


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Get metadata in cube')
    parser.add_argument('--path_olap',
                        type=str,
                        required=True,
                        default='all',
                        help='Path where is bim file.'
                             ' E.g: $Env:home\\projects\\analysis-services-features\\examples')

    args = parser.parse_args()  # <class 'argparse.ArgumentParser'>
    path_olap = args.path_olap

    main(path_olap=path_olap)
