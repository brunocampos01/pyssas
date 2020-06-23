import os
import subprocess
import argparse
from pyfiglet import Figlet
from sty import fg, bg, ef, rs


f = Figlet(font='slant')
HERE = os.path.abspath(os.path.dirname(__file__))

def main(func: str):
    print(f.renderText('PySSAS'))
    msg = ef.italic + 'Build and deploy SQL Server Analysis Services with Python\n ----- \n' + rs.italic
    print(msg)

    if 'cube_formatter' in func:
        path_cube_formatter = os.path.abspath(HERE + '/cube_formatter/')
        subprocess.call(f"python3 {path_cube_formatter}/cube_formatter.py --path_olap ."
            , shell=True)

    elif func == 'deploy':
        path_cube_formatter = os.path.abspath(HERE + '/cube_formatter/') 
        os.system(f'python3 {path_cube_formatter}/metadata_exporter.py')

    elif func == 'data_lineage':
        path_cube_formatter = os.path.abspath(HERE + '/cube_formatter/') 
        os.system(f'python3 {path_cube_formatter}/metadata_exporter.py')

    elif func == 'metadata_exporter':
        path_cube_formatter = os.path.abspath(HERE + '/cube_formatter/') 
        os.system(f'python3 {path_cube_formatter}/metadata_exporter.py')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='\cube_formatter --path_olap <PATH>'
                                                 '\ncube'
                                                 '\ndata_lineage'
                                                 '\nmetadata_exporter')
    parser.add_argument('--func',
                        type=str,
                        required=True,
                        help='WRITE: pyssas --func [cube_formatter --path_olap <PATH>] [data_lineage] [metadata_exporter] [deploy]')

    args = parser.parse_args()  # <class 'argparse.ArgumentParser'>
    func = args.func

    main(func=func)
