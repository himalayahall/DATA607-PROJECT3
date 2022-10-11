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

We are using **Slack** and **Zoom** as the primary collaboration tools. **Github** is used as the repository for all artifacts (R code, SQL scripts, ER diagrams, etc.). For ease of sharing data, we are using **AWS RDS MySql**.

## Data

Our data comes from a Kaggle project (https://docs.google.com/spreadsheets/d/1lac1H2IgCDCs9LLTQL6yb6MUPN1u4C5fJv_6YjipIaM/edit#gid=1072460513) which attempted to identify important Data Science skills using keyword searches on popular social/job websites like LinkedIn, Indeed, etc. This dataset was well structured and available as a multi-sheel MS Excel download. We tidyied up in R by extracting data from multiple sheets and generating CSVs to populate the core data model entities (see below).  

We discussed refreshing the dataset to make it more current but the APIs required paid subscriptions and we did not have the time to explore alternatives. However, we included timestamps in all entities to make it possible for time series data to coexist within our data model.

## Data Model

We started the data model exercise by leveraging the ER modeling capabilities of MySQLWorkbench. After creating the normalized data model entities we were able to generate the SQL scripts from schema creation from MySQLWorkbench which make it easy to forward engineer the schema on both AWS and local MySQL. The schema includes foreign key relationships and referential integrity checks/actions (e.g. cascade delete).

ER diagram - https://github.com/himalayahall/DATA607-PROJECT3/blob/main/ER.png

Entities:

1. SOURCE  
    Sources of demand data (Linkedin, Monster, etc.)
    
3. SKILL  
    Skills (R, NLP, Communication, etc.) and categories (Software, General, Soft)
    
5. EDUCATION  
    Education levels (BS, MS, etc.)
    
7. SKILL_IN_DEMAND  
    Skill demand (Source, skill, demand, etc.)
    
9. EDUCATION_IN_DEMAND  
    Education demand (Source, education, demand, etc.)


