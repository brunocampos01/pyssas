# PySSAS :star:
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/210d4a617a3d4411bab1d3618cafca89)](https://app.codacy.com/app/brunocampos01/becoming-a-python-expert?utm_source=github.com&utm_medium=referral&utm_content=brunocampos01/becoming-a-python-expert&utm_campaign=Badge_Grade_Dashboard)
![License](https://img.shields.io/badge/Code%20License-MIT-blue.svg)
[![Python 3.8](https://img.shields.io/badge/python-3.7-yellow.svg)](https://www.python.org/downloads/release/python-371/)

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
- MetaData Exporter
  - [x] Export queries from data source on  file `.sql`
  - [x] Export measures on file `.dax`
  - [x] Export calculated columns on file `.dax`
- Cube Formatter
  - [x] General parameters in tables, columns, calculated columns and measures
  - [x] Configure PK parameter in columns start `ID` and handler exceptions 
  - [x] Automate build and deploy 
- Data Lineage Generator
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



## Requirements
- Python 3.8 or more<br/>
```sh
sudo apt-get install Python3
```

- pip
```
sudo apt-get install python3-pip
```

- Python Virtual Environment
```sh
pip3 install --user virtualenv==16.6.0
```

- Install the libraries
```sh
pip3 install -r requirements.txt
```

- Git
```sh
sudo apt-get install git
```

- SSAS
  - Compatibility level: 1200


### FEATURE: MetaData Exporter
- To create dynamic documentation about the Business Intelligence project I decided to extract the information from:
  - measures
  - calculated columns
  - queries from data source

With this feature you can enter a job in an ETL system that runs the `metadata_exporter.py` and thus update the documentation every time the ETL process is executed.

#### Doc
```bash
python .\metadata_exporter.py -h

usage: metadata_exporter.py [-h] --path_olap PATH_OLAP

Get metadata in cube

optional arguments:
  -h, --help            show this help message and exit
  --path_olap PATH_OLAP
                        Path where is bim file. E.g: $Env:home\projects\analysis-services-features\examples
```

#### Quickstart
```
python .\metadata_exporter.py --path_olap $Env:home\projects\analysis-services-features\examples
```
As output 3 directories (queries, measures and calculated_cols) will be created within the *path_olap*.


### FEATURE: Cube Builder

#### Doc
```bash

```

#### Quickstart
```
python .\cube_builder.py --path_olap $Env:home\\projects\\analysis-services-features\\examples
```


### Motivation
I created these scripts to ensure standardized and fully replicable OLAP projects. This way we are able to create projects from scratch with a basic structure and identify with other SSIS projects.
<br/>
In addition, we have the great advantage of having the whole project documented through the code itself, demosntrando until the particularities of each case, for example:

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
                data['model']['tables'][table]['columns'][col]['isNullable'] = 'fals
```
In these cases above is shows that a common configuration is made to all but when it is a column that starts with the name `ID` different rules will apply.

- Um grande problema que enfrentei com o build do SSAS foi ter que repetir várias vezes asgumas confugurações. Por exemplo, em colunas PK, preciso configurar alguns parâmetros. Infelizmente no Visual Studio (SSDT) não há suporte para processos em lote.
- Havia casos que precisa configurar as mesmas propriedades para colunas especificas, por exemplo, garantir que colunas com o nome de `URL` sejam do tipo webUrl. Toda vez que adicionava uma dimensão no cubo tinha q ficar procurando essas propriedades específicas, que me fazia perder muuuuuuuito tempo. Agora, o que faço é executar o script de set e pronto, as propriedades são aplicadas.
- Outro fato q me motivou foi não depender do Visual Studio (SSDT). Agora consigo trabalhar em qualquer IDE e logo não tenho mais a dependencia de ter que trabalhar no Windows.



### FEATURE: Data Lineage Generator
...


## Running
1. Clone this repository
```sh
git clone https://github.com/brunocampos01/challenge-keyrus
cd challenge-keyrus
```

##### NOTES
This scripts capture informations of file `.bim`


---

#### Author
<a href="mailto:brunocampos01@gmail.com" target="_blank"><img class="" src="https://github.com/brunocampos01/devops/blob/master/images/gmail.png" width="28"></a>
<a href="https://github.com/brunocampos01" target="_blank"><img class="ai-subscribed-social-icon" src="https://github.com/brunocampos01/devops/blob/master/images/github.png" width="30"></a>
<a href="https://www.linkedin.com/in/brunocampos01/" target="_blank"><img class="ai-subscribed-social-icon" src="https://github.com/brunocampos01/devops/blob/master/images/linkedin.png" width="30"></a>
Bruno Aurélio Rôzza de Moura Campos 

---

#### Copyright
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br/>
