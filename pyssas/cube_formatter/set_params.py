def set_general_params(data: dict, folder_columns: str, folder_calculated_columns: str,
                       folder_measures: str, summarize: str):
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

        for col in range(0, len(data['model']['tables'][table]['columns'])):
            print(f"col = {col + 1} {(data['model']['tables'][table]['columns'][col]['name'])}")

            # ----- COLS: general params -----
            # summarizeBy -> none
            # displayFolder -> Colunas
            # description -> data lineage
            data['model']['tables'][table]['columns'][col]['summarizeBy'] = summarize
            data['model']['tables'][table]['columns'][col]['displayFolder'] = folder_columns

            # ----- col: calculated -----
            if 'type' in data['model']['tables'][table]['columns'][col]:

                if data['model']['tables'][table]['columns'][col]['type'] \
                        .startswith('calculated'):
                    data['model']['tables'][table]['columns'][col]['isKey'] = 'false'
                    data['model']['tables'][table]['columns'][col]['displayFolder'] = folder_calculated_columns
                    data['model']['tables'][table]['columns'][col]['description'] = \
                        data['model']['tables'][table]['columns'][col]['expression']

                    # ------------------------------ END ------------------------------

        # ----- measures -----
        if 'measures' in data['model']['tables'][table]:

            for measure_number in range(0, len(data['model']['tables'][table]['measures'])):
                print(f"measure = {measure_number + 1} "
                      f"{(data['model']['tables'][table]['measures'][measure_number]['name'])}")

                # general configs
                data['model']['tables'][table]['measures'][measure_number]['displayFolder'] = folder_measures
                data['model']['tables'][table]['measures'][measure_number]['description'] = \
                    data['model']['tables'][table]['measures'][measure_number]['expression']

    return data


def set_pk_params(data: dict, list_table_exceptions: list, list_col_exceptions: list):
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

        for col in range(0, len(data['model']['tables'][table]['columns'])):
            print(f"col = {col + 1} {(data['model']['tables'][table]['columns'][col]['name'])}")

            # ----- COLS ID: general params -----
            # isKey -> true
            # formatString -> 0
            # dataType -> int64
            # isHidden -> true
            # isNullable -> false
            if data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('ID'):
                data['model']['tables'][table]['columns'][col]['formatString'] = '0'
                data['model']['tables'][table]['columns'][col]['dataType'] = 'int64'
                data['model']['tables'][table]['columns'][col]['isHidden'] = 'true'
                data['model']['tables'][table]['columns'][col]['isNullable'] = 'false'
                data['model']['tables'][table]['columns'][col]['isKey'] = 'true'

                # ----- COLS ID: specific params -----
                for exception in list_table_exceptions:
                    if data['model']['tables'][table]['name'].startswith(exception):
                        data['model']['tables'][table]['columns'][col]['isNullable'] = 'true'
                        data['model']['tables'][table]['columns'][col]['isKey'] = 'false'
                        data['model']['tables'][table]['columns'][col]['dataType'] = 'string'
                        data['model']['tables'][table]['columns'][col]['formatString'] = 'string'

                for exception in list_col_exceptions:
                    if data['model']['tables'][table]['columns'][col]['name'].startswith(exception):
                        data['model']['tables'][table]['columns'][col]['isNullable'] = 'true'
                        data['model']['tables'][table]['columns'][col]['isKey'] = 'false'
                        data['model']['tables'][table]['columns'][col]['dataType'] = 'string'
                        data['model']['tables'][table]['columns'][col]['formatString'] = 'string'

    return data
