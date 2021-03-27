# PySSAS 
[![Python 3.8](https://img.shields.io/badge/Python-3-green.svg)](https://www.python.org/downloads/release/python-38/)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/210d4a617a3d4411bab1d3618cafca89)](https://app.codacy.com/app/brunocampos01/becoming-a-python-expert?utm_source=github.com&utm_medium=referral&utm_content=brunocampos01/becoming-a-python-expert&utm_campaign=Badge_Grade_Dashboard)
![License](https://img.shields.io/badge/Code%20License-MIT-green.svg)

SQL Server Analysis Services (SSAS) features extensions.


<img src="img/ssas.png" align="right" height=auto width=28%/>
<img src="img/python.svg" align="left" height=auto width=15%/>

```bash
    ____        __________ ___   _____
   / __ \__  __/ ___/ ___//   | / ___/
  / /_/ / / / /\__ \\__ \/ /| | \__ \ 
 / ____/ /_/ /___/ /__/ / ___ |___/ / 
/_/    \__, //____/____/_/  |_/____/  
      /____/                        

SQL Server Analysis Services with Python
```

## Features
- GoalData Exporter
  - [x] Export queries from data source on  file `.sql`
  - [x] Export measures on file `.dax`
  - [x] Export calculated columns on file `.dax`
- Cube Formatter
  - [x] General parameters in tables, columns, calculated columns and measures
  - [x] Configure PK parameter in columns start `ID` and handler exceptions 
  - [ ] Automated deploy 
- Data Lineage Generator (in development)
  - By Table
    - [x] Create data lineage (data warehouse -> analysis services)
    - [ ] Create data lineage (stage -> data warehouse)
    - [ ] Create data lineage (data source -> stage)
    - [ ] Create data lineage (data source -> stage -> data warehouse -> analysis services)
  - By Column
    - [ ] Create data lineage (data warehouse -> analysis services)
    - [ ] Create data lineage (stage -> data warehouse)
    - [ ] Create data lineage (data source -> stage)
    - [ ] Create data lineage (data source -> stage -> data warehouse -> analysis services)
- [ ] dynamic configuration


## Requirements

- SSAS: compatibility level: tabular 1200
- Project SSAS name must contains one of these words:
  - ssas
  - bi
  - olap
  - tabular

- pyssas
```sh
pip install pyssas
```

---

### :star: FEATURE: `metadata_exporter`
To create dynamic documentation about the Business Intelligence project.
With this feature you can enter a job in an ETL system that runs the `pyssas --func metadata_exporter` and thus update the documentation every time the ETL process is executed.

#### Usage
```bash
cd <project_ssas>
pyssas --func metadata_exporter
```
As output 3 directories (queries, measures and calculated_cols) will be created within the *path_olap*.

#### Test
```bash
cd examples/
pyssas --func metadata_exporter
```

### :star: FEATURE: `cube_formatter`
I created these scripts to ensure standardized and fully **replicable OLAP projects**. This way we are able to create projects from scratch with a basic structure and identify with other SSIS projects.
<br/>
In addition, we have the great advantage of having the whole **project documented through the code itself**.
<br/>
Example:
- In these cases bellow is shows that a common configuration is made to all but when it is a column that starts with the name `ID` different rules will apply.

```python
            # ----- COLS: general params -----
            # summarizeBy -> none
            # formatString -> 0
            # dataType -> string
            # displayFolder -> Colunas
            # description -> data lineage
            data['model']['tables'][table]['columns'][col]['summarizeBy'] = 'none'
            data['model']['tables'][table]['columns'][col]['formatString'] = "0"
            data['model']['tables'][table]['columns'][col]['dataType'] = 'string'
            data['model']['tables'][table]['columns'][col]['displayFolder'] = 'Colunas'
            data['model']['tables'][table]['columns'][col]['description'] = \
                dict_tables.get(data['model']['tables'][table]['name'].lower())

            if data['model']['tables'][table]['columns'][col]['name'] \
                    .startswith('ID'):
                data['model']['tables'][table]['columns'][col]['formatString'] = '#,0'
                data['model']['tables'][table]['columns'][col]['dataType'] = 'int64'
                data['model']['tables'][table]['columns'][col]['isHidden'] = 'true'
                data['model']['tables'][table]['columns'][col]['isNullable'] = 'false
```

- A big problem I faced with building the SSAS was having to repeat several times the some confurations. For example, in PK columns, I need to configure some parameters. Unfortunately in Visual Studio (SSDT) there is no support for batch processes.
- There were cases that you need to configure the same properties for specific columns, for example, make sure that columns named `URL` are of type webUrl. Every time I added a dimension to the cube I had to keep looking for those specific properties, which made me lose a lot of time. Now, what I do is run the set script and that's it, the properties are applied.
- Another fact that motivated me was not to depend on Visual Studio (SSDT). Now I can work in any IDE and soon I don't have the dependency of having to work in Windows anymore.

#### Usage
```bash
cd <project_ssas>
pyssas --func cube_formatter
```

#### Test
```bash
cd examples/
pyssas --func cube_formatter
```

#### Personal Configuration
- Change properties folder_columns, folder_measures, folder_calculated_columns and summarize
  - Open the file [config.py](https://github.com/brunocampos01/pyssas/blob/master/pyssas/config.py) and add in `CUBE_GENERAL_CONFIG`
- Add list_table_exceptions or list_col_exceptions to not formatt
  - Open the file [config.py](https://github.com/brunocampos01/pyssas/blob/master/pyssas/config.py) and add in `EXCEPTIONS_PK_CONFIG`

**NOTE:** the next feature this project must need config.py by SSAS project. This do will the module work with dynamic configuration. 


#### Add DATABASE_CONFIG to validate Lineage
Open the file [config.py](https://github.com/brunocampos01/pyssas/blob/master/pyssas/config.py) and add configuration your database in `DATABASE_CONFIG`


##### NOTES
This scripts capture informations of file `.bim`

---

<p  align="left">
<br/>
<a href="mailto:brunocampos01@gmail.com" target="_blank"><img src="https://github.com/brunocampos01/devops/blob/master/images/email.png" alt="Gmail" width="30">
</a>
<a href="https://stackoverflow.com/users/8329698/bruno-campos" target="_blank"><img src="https://github.com/brunocampos01/devops/blob/master/images/stackoverflow.png" alt="GitHub" width="30">
</a>
<a href="https://www.linkedin.com/in/brunocampos01" target="_blank"><img src="https://github.com/brunocampos01/devops/blob/master/images/linkedin.png" alt="LinkedIn" width="30"></a>
<a href="https://github.com/brunocampos01" target="_blank"><img src="https://github.com/brunocampos01/devops/blob/master/images/github.png" alt="GitHub" width="30"></a>
<a href="https://brunocampos01.netlify.app/" target="_blank"><img src="https://github.com/brunocampos01/devops/blob/master/images/blog.png" alt="Website" width="30">
</a>
<a href="https://medium.com/@brunocampos01" target="_blank"><img src="https://github.com/brunocampos01/devops/blob/master/images/medium.png" alt="GitHub" width="30">
</a>
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png",  align="right" /></a><br/>
</p>
