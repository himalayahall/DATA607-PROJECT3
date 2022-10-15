library(RMariaDB)
library(tidyverse)

# store password
pw <- 'guestpass'
hostname <- 'cunyspsds.c5iiratvieki.us-east-1.rds.amazonaws.com'

# reading the database into R using RMariaDB
projectDb <- dbConnect(MariaDB(), user='guest', password=pw, 
                      dbname='Project3', host=hostname)

# preview the tables
dbListTables(projectDb)

# query1: import education_in_demand table
query1 <- "SELECT * FROM EDUCATION_IN_DEMAND;"
# store the results as a dataframe
results1 <- dbSendQuery(projectDb,query1)
education <- dbFetch(results1)
dbClearResult(results1) ## clear the result 

head(education)

# query2: import skill_in_demand table
query2 <- "SELECT * FROM SKILL_IN_DEMAND;"
# store the results as a dataframe
results2 <- dbSendQuery(projectDb,query2)
skills <- dbFetch(results2)
dbClearResult(results2) # clear the result

head(skills)

# close the db connection
dbDisconnect(projectDb)

# EDA1 - education count by keyword
education |>
  group_by(EDUCATION = EDUCATION_KEYWORD) |>
  summarize(TOTAL=sum(COUNT)) |>
  arrange(desc(TOTAL))

# EDA - education count by source
education |>
  group_by(SOURCE = SOURCE_NAME) |>
  summarize(TOTAL=sum(COUNT)) |>
  arrange(desc(TOTAL))

# EDA3 - skills count by keyword
skills |> 
  group_by(SKILL = SKILL_KEYWORD) |>
  summarize(TOTAL=sum(COUNT)) |>
  arrange(desc(TOTAL))

# skills count by keyword graphic
skills_count <- skills |> 
  group_by(SKILL = SKILL_KEYWORD) |>
  summarize(TOTAL=sum(COUNT)) |>
  arrange(desc(TOTAL))

ggplot(skills_count, aes(x=reorder(SKILL, TOTAL),
                         y=TOTAL)) +
  geom_col() +
  coord_flip() + 
  theme_minimal() +
  theme(axis.text.y = element_text(size = 4)) +
  labs(x = "SKILL", title="SKILLS IN DEMAND")
  
# EDA4 - skills count by source
skills |>
  group_by(SOURCE = SOURCE_NAME) |>
  summarize(TOTAL=sum(COUNT)) |>
  arrange(desc(TOTAL))

### Additional questions to address:

# The percentage of listings in which each skill appears
# How to combine the skill and education dataframes
# Is the source relevant to analysis? 