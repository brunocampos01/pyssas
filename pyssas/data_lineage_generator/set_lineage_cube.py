def set_lineage_cube(data: dict, dict_tables: dict):
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

        # description -> data lineage
        data['model']['tables'][table]['description'] = \
            dict_tables.get(data['model']['tables'][table]['name'].lower())

        for col in range(0, len(data['model']['tables'][table]['columns'])):
            print(f"col = {col + 1} {(data['model']['tables'][table]['columns'][col]['name'])}")

            data['model']['tables'][table]['columns'][col]['description'] = \
                dict_tables.get(data['model']['tables'][table]['name'].lower())

            print(data['model']['tables'][table]['columns'][col]['description'])

    return data
