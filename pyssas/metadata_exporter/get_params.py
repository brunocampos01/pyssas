"""json format (bim file)

    "name": "",
    "description": "",
    "columns": [...],
    "partitions": [...],
    "measures": [...],
    "annotations": [...]
"""


def get_measures(data: dict):
    print()
    print(79 * '*')
    print(f"Getting measures at {(data['model']['name'])} cube")
    print(79 * '*')
    list_name_measures_by_bim = []
    list_measures_by_bim = []

    for table in range(0, len(data['model']['tables'])):
        #print(f"\n{40 * '*'} table: {data['model']['tables'][table]['name']} {40 * '*'} ")

        if 'measures' in data['model']['tables'][table]:
            for measure_number in range(0, len(data['model']['tables'][table]['measures'])):
                name = (data['model']['tables'][table]['measures'][measure_number]['name'])
                expression = data['model']['tables'][table]['measures'][measure_number]['expression']
                list_name_measures_by_bim.append(name)
                list_measures_by_bim.append(expression)
                #print(name)

    return list_measures_by_bim, list_name_measures_by_bim


def get_calculated_col(data: dict):
    print()
    print(79 * '*')
    print(f"Getting calculated_col in {(data['model']['name'])} cube")
    print(79 * '*')
    list_name_calculated_col_by_bim = []
    list_calculated_col_by_bim = []

    for table in range(0, len(data['model']['tables'])):
        #print(f"\n{40 * '*'} table: {data['model']['tables'][table]['name']} {40 * '*'} ")

        for col in range(0, len(data['model']['tables'][table]['columns'])):

            if 'type' in data['model']['tables'][table]['columns'][col]:

                if data['model']['tables'][table]['columns'][col]['type'] \
                        .startswith('calculated'):
                    name = (data['model']['tables'][table]['columns'][col]['name'])
                    expression = data['model']['tables'][table]['columns'][col]['expression']
                    list_name_calculated_col_by_bim.append(name)
                    list_calculated_col_by_bim.append(expression)
                    print(name)

    return list_calculated_col_by_bim, list_name_calculated_col_by_bim


def get_queries(data: dict):
    print()
    print(79 * '*')
    print(f"Getting queries in {(data['model']['name'])} cube")
    print(79 * '*')
    list_queries = []
    list_name_queries = []

    for table in range(0, len(data['model']['tables'])):
        #print(f"\n{40 * '*'} table: {data['model']['tables'][table]['name']} {40 * '*'} ")

        for partitions in range(0, len(data['model']['tables'][table]['partitions'])):
            name = data['model']['tables'][table]['partitions'][partitions]['name']
            query = data['model']['tables'][table]['partitions'][partitions]['source']['query']
            list_name_queries.append(name)
            list_queries.append(query)
            print(name)

    return list_queries, list_name_queries
