# Analysis Services Features Extension :star:
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/210d4a617a3d4411bab1d3618cafca89)](https://app.codacy.com/app/brunocampos01/becoming-a-python-expert?utm_source=github.com&utm_medium=referral&utm_content=brunocampos01/becoming-a-python-expert&utm_campaign=Badge_Grade_Dashboard)
![License](https://img.shields.io/badge/Code%20License-MIT-blue.svg)
[![Python 3.7](https://img.shields.io/badge/python-3.7-yellow.svg)](https://www.python.org/downloads/release/python-371/)

**SSAS as a code**

## Features
- FEATURE: MetaData Exporter
  - [x] :+1: Export queries from data source on  file `.sql`
  - [x] :+1: Export measures on file `.dax`
  - [x] :+1: Export calculated columns on file `.dax`
- FEATURE: Builder cube
   - [x] Values in every tables, columns, calculated columns and measures
- FEATURE: Data Lineage Generator
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
- Para criar uma documentação dinâmica sobre o projeto de Business Inteligence decidi extrair as informações de:
  - measures
  - calculated columns
  - queries from data source

Com esta feature é possível inserir um job em um sistema de ETL que execute o `metadata_exporter.py` e assim atualizar a documentação toda vez que o processo de ETL é executado.

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
Como saída será criado 3 diretórios (queries, measures and calculated_cols) dentro do *path_olap* informado.


## Quickstart
- Generate data leneage
```
python map_olap_to_dw.py
```

- Configure cube
```
python set.py --olap_project_name "BI"
```

- Get queries, measures, calculated columns
```
python get.py
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

### FEATURE: Cube Builder
...


## Running
1. Clone this repository
```sh
git clone https://github.com/brunocampos01/challenge-keyrus
cd challenge-keyrus
```

##### NOTES
This scripts capture informations of file `.bim`


## TODO
- [ ] implement design fluent
- [ ] implement creator relationalship
- [ ] implement default builder


---

## Author
- Bruno Aurélio Rôzza de Moura Campos (brunocampos01@gmail.com)

## Copyright
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work by <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">Bruno A. R. M. Campos</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
