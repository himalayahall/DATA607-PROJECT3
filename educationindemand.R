library(tidyverse)
library(readxl)
library(stringr)
library(lubridate)

# read master file locally 
# read master file locally 
file <- "/Users/Melissa/OneDrive/Documents/CUNY/Fall 2022/Data 607/Project 3/Data Science Career Terms (2).xlsx"
excel <- read_excel(file)

# store sheet names
sheets <- excel_sheets(file)

education <- read_excel(file, sheet=sheets[7])

# keyword to uppercase
# pivot columns to source
# source column to uppercase
# add date column
# drop AngelList column
# drop NA values
education_transformed <- education |>
  mutate(Keyword = toupper(Keyword)) |>
  rename(KEYWORD = Keyword) |>
  pivot_longer(cols=("LinkedIn":"SimplyHired"), names_to="SOURCE", values_to="COUNT") |>
  mutate(SOURCE = toupper(SOURCE), SURVEY_DATE=ymd("2018-06-15")) |>
  subset(select = -c(AngelList)) |>
  drop_na() |>
  arrange(KEYWORD,SOURCE)

#write to csv
path <- "/Users/Melissa/OneDrive/Documents/CUNY/Fall 2022/Data 607/Project 3/education_in_demand.csv"
write.csv(education_transformed, path)

