library(tidyverse)
library(readxl)
library(stringr)
library(lubridate)

#general skills
gs <- "https://raw.githubusercontent.com/himalayahall/DATA607-PROJECT3/main/general_skills.csv"
# software skills
ss <- "https://raw.githubusercontent.com/himalayahall/DATA607-PROJECT3/main/software_skills.csv"

#read into R
general_skills <- read.csv(gs)
software_skills <- read.csv(ss)

#fix typo in general_skills "category" column
general_skills$CATEGORY <- gsub("GERERAL", "GENERAL", general_skills$CATEGORY)

#union the dataframes
all_skills <- rbind(general_skills, software_skills)

#write to csv
path <- "/Users/joshiden/Documents/Classes/CUNY SPS/Fall 2022/DATA 607/Projects/all_skills.csv"
write.csv(all_skills, path, row.names=FALSE)

#####

# read master file locally 
file <- "/Users/joshiden/Documents/Classes/CUNY SPS/Fall 2022/DATA 607/DATA-607/Project 3/Data Science Career Terms.xlsx"
excel <- read_excel(file)

# store sheet names
sheets <- excel_sheets(file)

ds_skills <- read_excel(file, sheet = sheets[1])
ds_software <- read_excel(file, sheet = sheets[2])
skills <- read_excel(file, sheet = sheets[3])
software <- read_excel(file, sheet = sheets[4])
general <- read_excel(file, sheet = sheets[5])
VR <- read_excel(file, sheet = sheets[6])
education <- read_excel(file, sheet=sheets[7])

head(ds_skills)

# keep only first 15 rows
# Keyword to upper
# pivot columns to column: source
ds_skills_transformed <- ds_skills |>
  head(15) |>
  mutate(Keyword = toupper(Keyword)) |>
  rename(KEYWORD = Keyword) |>
  pivot_longer(cols=("LinkedIn":"Monster"), names_to="SOURCE", values_to="COUNT") |>
  mutate(SOURCE = toupper(SOURCE), SURVEY_DATE=ymd("2018-06-15")) |>
  arrange(KEYWORD,SOURCE)

ds_skills_transformed

# keep top 37 rows
# keyword to upper
# pivot columns to source
# source column to upper
# add date column
ds_software_transformed <- ds_software |>
  select(c("Keyword":"Monster")) |>
  head(37) |>
  mutate(Keyword = toupper(Keyword)) |>
  rename(KEYWORD = Keyword) |>
  pivot_longer(cols=("LinkedIn":"Monster"), names_to="SOURCE", values_to="COUNT") |>
  mutate(SOURCE = toupper(SOURCE), SURVEY_DATE=ymd("2018-06-15")) |>
  arrange(KEYWORD,SOURCE)

ds_software_transformed

# union the datasets: skills_in_demand
skills_in_demand <- rbind(ds_skills_transformed,ds_software_transformed)
skills_in_demand

#write to csv
path <- "/Users/joshiden/Documents/Classes/CUNY SPS/Fall 2022/DATA 607/Projects/skills_in_demand.csv"
write.csv(skills_in_demand, path, row.names=FALSE)


