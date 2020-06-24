import argparse
import os
import sys

import config
from map_olap_to_dw import *
from set_lineage_cube import *
from utils.files import *

here = os.path.abspath(os.path.dirname(__file__))
path_outside = os.path.join(here + '/..')
sys.path.insert(1, path_outside)

path_tmp = config.PATHS['tmp']
path_dict = os.path.join(path_outside + path_tmp)


def main(path_olap: str):
    list_proj_name = get_proj_name(path=path_olap)
    list_path_proj = get_path_projects(path_olap=path_olap)
    list_path_bim = get_path_bim(list_path_proj=list_path_proj)

    for name_project in list_proj_name:
        list_path_dict_data_lineage = get_path_pickle(path=path_dict, name_project=name_project)
        print(list_proj_name)

        # open dict data lineage of tables and columns
        dict_cols = dict()
        dict_tables = dict()

        for path_dict_data_lineage in list_path_dict_data_lineage:
            print()
            print(path_dict_data_lineage)

            if ('cols_' + name_project + '.') in path_dict_data_lineage:
                print('\n\nGraph of cols (data lineage)')
                graph_cols = open_dict_map(path_dict=path_dict_data_lineage)
                dict_cols = graph_cols
                #pp.pprint(dict_cols)
            else:
                print('\n\nGraph of tables (data lineage)')
                graph_tables = open_dict_map(path_dict=path_dict_data_lineage)
                dict_tables = graph_tables
                pp.pprint(dict_tables)

        for path_bim in list_path_bim:
            bim_file = open_bim_file_json(path_bim=path_bim)
            data = set_lineage_cube(data=bim_file,
                                    dict_tables=dict_tables)
            write_bim_file_json(bim_file=data, path_bim=path_bim)
            data = open_bim_file(path_bim=path_bim)
            write_changes_bim(bim_stream=data, path_bim=path_bim)
            break
        break


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Data lineage in cube')
    parser.add_argument('--path_olap',
                        type=str,
                        required=True,
                        default='all',
                        help='Path where is bim file.'
                             ' E.g: $Env:home\\projects\\analysis-services-features\\examples')

    args = parser.parse_args()  # <class 'argparse.ArgumentParser'>
    path_olap = args.path_olap

    main(path_olap=path_olap)
