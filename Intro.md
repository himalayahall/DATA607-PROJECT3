## Project 3 Overview

This document provides an overview of the group members, tools, and data documentation for Project 3

#######################

## Members

Jawaid Hakim  
Josh Iden  
Mathew Katz  
Melissa Bowman  
Christian Uriostegui

## Tools

We are using **Slack** and **Zoom** as the primary collaboration tools. **Github** is used as the repository for all artifacts (Project documentation, R code, SQL scripts, ER diagram, etc.). We chose **MySQL** for our relations database. Furthermore, to facilitate sharing of schema and data, we are using **AWS RDS MySql**.

## Data

Our data comes from a Kaggle project which attempted to identify important Data Science skills using keyword searches on popular social/job websites like LinkedIn, Indeed, etc. This dataset was well structured and available as a multi-sheel MS Excel download (https://docs.google.com/spreadsheets/d/1lac1H2IgCDCs9LLTQL6yb6MUPN1u4C5fJv_6YjipIaM/edit#gid=1072460513).  

We tidyied up in R by extracting data from multiple sheets and generating CSVs to populate the core data model entities (see below). This involved data transformations such as categorizing skills, adding survey timestamp, etc.  

We discussed refreshing the dataset to make it more current but the vendor APIs require paid subscriptions and we did not have time to explore no-fee alternatives. However, we have decided added timestamps to all entities in our data model. This design feature can be leveraged by future projects to do time series analysis of required skills and education.

## Data Model

We started the data model exercise by leveraging the ER modeling capabilities of MySQLWorkbench. After creating the normalized data model entities we were able to auto-generate schema creation SQL scripts, which make it easy to forward engineer schema on both AWS and local MySQL. Schema includes foreign key relationships and referential integrity checks/actions (e.g. cascade delete). As mentioned above, entities include timestamps for tracking survey date and record level create/update actions.

ER diagram - https://github.com/himalayahall/DATA607-PROJECT3/blob/main/ER.png

Entities:

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


