import pyodbc


def conn(sql_server: str, server: str, database: str, username: str,
         password: str):
    try:
        return pyodbc.connect('DRIVER={' + sql_server + '};'
                              'SERVER=' + server + ';'
                              'DATABASE=' + database + ';'
                              'UID=' + username + ';'
                              'PWD=' + password)
    except pyodbc.Error:
        print(f"Connection failed!\nargs:\n{locals()}")
        raise


def execute_query(cnxn: str, query: str):
    cursor = cnxn.cursor()
    cursor.execute(query)
    return cursor