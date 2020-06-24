DATABASE_CONFIG = {
    'sql_server': 'ODBC Driver 17 for SQL Server',
    'server': '<IP>',
    'database': '<DB_NAME>',
    'username': '<USER_NAME>',
    'password': '<PASSWD>'
}

PATHS = {
    'dw': '/data_base/',
    'ssis': '/etl/ssis/',
    'ssas': '/olap/analysis_services/',
    'stored_procedures': 'stored_procedures/',
    'tmp': '/../tmp/'
}

CUBE_GENERAL_CONFIG = {
    'folder_columns': 'Colunas',
    'folder_measures': 'Medidas',
    'folder_calculated_columns': 'Medidas',
    'summarize': 'none'
}

EXCEPTIONS_PK_CONFIG = {
    'list_cols_exceptions': {'IDHR,'
                             'IDUSUARIOHIST,'
                             'IDDTAPURACAO Manipulado,'
                             'IDDTAPURACAO'},
    'list_tables_exceptions': {'f',
                               'fact',
                               'dTempo',
                               'dimTempo',
                               'dTime',
                               'dEquipe'}
}
