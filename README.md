# CUNY Data 607 Project3

## Artifacts

* ER.mwb - ER diagram 

* Data Science Career Terms - Data set

* create_schema.sql - Schema creation script

* sources.csv - data sources, e.g. LINKEDIN

* general_skills.csv - general skills for Data Science

* software_skills.csv - software skills for Data Science

* soft_skills.csv - 'soft'skills for Data Science

* skills_in_demand.csv - skill in demand

* education.csv - education on keyworks

* education_in_demand.csv - education in demand

## Create MySql Schema (local or cloud)

1. Launch your favorite database tool - e.g. MySQLWorkbench. Connect to the database server using admin-level privileges since you will be creating a new schema in the connected server. If tables have already been created by your admin, skip the next step and go to loading data into tables.

2. Database schema can be created in one of two ways:

   - Execute **create_schema.sql** (command line or within MySqlWorkbench)
   - Forward Engineer database using **ER.mwb**  (within MySqlWorkbench)
   
3. Load data into tables

- Polulate **SOURCE** table - load sources.csv

  - SOURCE -> SOURCE_NAME

- Populate **SKILL** table - load general_skills.csv, software_skills.csv, and soft_skills.csv. Map columns as follows from source column (CSV column) to destination column (table column):

  - KEYWORD -> SKILL_KEYWORD
  - CATEGORY -> CATEGORY

- Populate **SKILL_IN_DEMAND** table - load skills_in_demand.csv

  - KEYWORD -> SKILL_KEYWORD
  - SOURCE -> SOURCE_NAME
  - COUNT -> COUNT
  - SURVEY_DATE -> SURVEY_DATE
  
- Populate **EDUCATION** table (optional) - load education.csv
  
  - KEYWORD -> EDUCATION_KEYWORD
  
- Populate **EDUCATION_IN_DEMAND** table (optional) - load education_in_demand.csv
  
  - KEYWORD -> EDUCATION_KEYWORD
  - SOURCE -> SOURCE_NAME
  - COUNT -> COUNT



