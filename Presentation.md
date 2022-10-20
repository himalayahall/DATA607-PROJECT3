# Presentation

## TODO
- [ ] Data - Josh
- [ ] Data Model - Jawaid
- [ ] Data Wrangling - Melissa
- [ ] Database - Jawaid
- [ ] EDAs - Josh and Christian

# Project Overview

See [Intro](https://github.com/himalayahall/DATA607-PROJECT3/blob/main/Intro.md) for team introduction and project overview. 

# Data


## Data Model

![ER Diagram](https://github.com/himalayahall/DATA607-PROJECT3/blob/main/images/ER.png)

<details><summary>Entities (Click Me)</summary>

1. SOURCE  
    Sources of demand data (Linkedin, Monster, etc.)
    
3. SKILL  
    Skills (R, NLP, Communication, etc.) and categories. Skill categories are T_SOFTWARE, T_GENERAL, and SOFT. The *T_* prefeix designates *technical* skills - *software* and *general*. The prefix also makes it straightforward to filter technical skills from *soft* skills. 
    
5. EDUCATION  
    Education levels (BS, MS, etc.)
    
7. SKILL_IN_DEMAND  
    Skill demand (Source, skill, demand, etc.)
    
9. EDUCATION_IN_DEMAND  
    Education demand (Source, education, demand, etc.)
</details>

## Data Wrangling

## Database Design and Data Loading

```mermaid
flowchart TD;
    
    subgraph Database Install
    
        id1((Start))-- Provision -->id2[(AWS MySQL)]
        
        id2-. Monitor .->id3(AWS CloudWatch)
    
    end
    
    subgraph Data Model and Schema Creation
    
        id10((Start))-- Model -->id20{Done?}
    
        id20-- Yes -->id30(ER)
    
        id20-- No -->id10
    
        id30-- Auto Generate -->id40(DDL SQL Script)
    
        id40-- Execute -->id2

    end
    
    subgraph Data Wrangling  

        id6[\Source Data\]-- Download-->id7(CSV)

        id7-. Read .->id110
        
        id100((Start))-- Create -->id110(R Scripts)
        
        id110-- Load Data --> id2
        
      end

```

# Exploratory Data Analysis
