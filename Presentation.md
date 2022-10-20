# Presentation

## TODO
- [ ] Data  - Melissa
- [ ] Data Wrangling - Josh
- [ ] Database Design and Data Loading - Jawaid
- [ ] Data Model - Jawaid
- [ ] EDAs - Josh and Christian

# Project Overview

See [Intro](https://github.com/himalayahall/DATA607-PROJECT3/blob/main/Intro.md) for team introduction and project overview. 

# Data Source
(describe data source)

## Data Wrangling 
(describe data wrangling strategy - R scripts, manual population of smaller tables, etc.)

## Database Design and Data Loading 
(describe database design approach and data loading)

```mermaid
flowchart TD;
    
    subgraph Database Install
    
        id1((Start))-- Provision -->id2[(AWS MySQL)]
        
        id2-. Monitor .->id3(AWS CloudWatch)
    
    end
    
    subgraph Data Model and Schema Creation
    
        id10((Start))-- Data Model -->id20{Good enough?}
    
        id20-- Yes -->id30(ER)
    
        id20-- No -->id10
    
        id30-- Auto Generate -->id40(DDL SQL Script)
    
        id40-- Execute -->id2

    end
    
    subgraph Data Wrangling  

        id6[\Source Data\]-- Download-->id7(XSLX)

        id7-. Read .->id110
        
        id100((Start))-- Create -->id110(R Scripts)
        
        id110-- Load Data --> id2
        
      end

```

## Data Model
(describe data model)

![ER Diagram](https://github.com/himalayahall/DATA607-PROJECT3/blob/main/images/ER.png)

<details><summary>Entities (Click Me)</summary>

1. SOURCE  
    Sources of demand data (Linkedin, Monster, etc.)
    
3. SKILL  
    - Skill (R, NLP, Communication, etc.)
    - Category - in the source dataset skills are grouped 2 tabs: **DS skills**, and **DS software**. Within *DS software* are **technical** skills (machine learning, statistics, etc.) and **soft** skills (communication and project management). Since these sub-catrgories are not identified explicitly in the source dataset, manual tagging was necessary. The final category buckets are **T_SOFTWARE**, **T_GENERAL**, and **SOFT**. The *T* prefeix designates *technical* skills, which includes both  *software* and *general*. Adding the prefix also makes it straightforward to filter technical and soft Data Science skills. 
    
5. EDUCATION  
    Education levels (BS, MS, etc.)
    
7. SKILL_IN_DEMAND  
    Skill demand (Source, skill, demand, etc.)
    
9. EDUCATION_IN_DEMAND  
    Education demand (Source, education, demand, etc.)
</details>

# Exploratory Data Analysis 
(describe EDAs)
