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

## Create (local) MySql Database

1. Database schema can be created in one of two ways:

   - Execute **create_schema.sql** (command line or within MySqlWorkbench)
   - Forward Engineer database using **ER.mwb**  (within MySqlWorkbench)
   
2. Load data into tables

- Populate SKILL table - load general_skills.csv, software_skills.csv, and soft_skills.csv. Map columns as follows from source column (CSV column) to destination column (table column):

  - KEYWORD -> SKILL_KEYWORD
  - CATEGORY -> CATEGORY

- Polulate SOURCE table - load sources.csv

  - SOURCE -> SOURCE_NAME

- Populate SKILL_IN_DEMAND table - load skills_in_demand.csv

  - KEYWORD -> SKILL_KEYWORD
  - SOURCE -> SOURCE_NAME
  - COUNT -> COUNT
  - SURVEY_DATE -> SURVEY_DATE
  
- Populate EDUCATION table (optional) - load education.csv
  
  - KEYWORD -> EDUCATION_KEYWORD
  
- Populate EDUCATION_IN_DEMAND table (optional) - load education_in_demand.csv
  
  - KEYWORD -> EDUCATION_KEYWORD
  - SOURCE -> SOURCE_NAME
  - COUNT -> COUNT



