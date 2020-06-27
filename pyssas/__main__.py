import argparse
import os
import subprocess
from pyfiglet import Figlet

from pyssas.cube_formatter.cube_formatter import *

f = Figlet(font='slant')
HERE = os.path.abspath(os.path.dirname(__file__))


def main():
    parser = argparse.ArgumentParser(description='\cube_formatter --path_olap <PATH>'
                                                 '\ncube'
                                                 '\ndata_lineage'
                                                 '\nmetadata_exporter')
    parser.add_argument('--func',
                        type=str,
                        required=True,
                        help='WRITE: pyssas --func [cube_formatter --path_olap <PATH>] [data_lineage_generator] [metadata_exporter] [deploy]')

    args = parser.parse_args()  # <class 'argparse.ArgumentParser'>
    func = args.func

    print(f.renderText('PySSAS'))
    print('Build and deploy SQL Server Analysis Services with Python\n ----- \n')

    if 'cube_formatter' in func:
        path_cube_formatter = os.path.abspath(HERE + '/cube_formatter/')
        subprocess.call(f"python3 {path_cube_formatter}/cube_formatter.py --path_olap .",
                        shell=True)

    elif func == 'data_lineage_generator':
        path_cube_formatter = os.path.abspath(HERE + '/data_lineage_generator/')
        subprocess.call(f'python3 {path_cube_formatter}/data_lineage_generator.py --path_olap .',
                        shell=True)

    elif func == 'metadata_exporter':
        path_cube_formatter = os.path.abspath(HERE + '/metadata_exporter/')
        subprocess.call(f'python3 {path_cube_formatter}/metadata_exporter.py --path_olap .,',
                        shell=True)


if __name__ == '__main__':
    main()
