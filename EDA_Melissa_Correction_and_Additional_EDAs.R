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

# query1: import education_in_demand table (Josh already did this one)
query1 <- "SELECT * FROM EDUCATION_IN_DEMAND;"
# store the results as a dataframe
results1 <- dbSendQuery(projectDb,query1)
education <- dbFetch(results1)
dbClearResult(results1) ## clear the result 

head(education)

# query2: import skill_in_demand table (Josh already did this one)
query2 <- "SELECT * FROM SKILL_IN_DEMAND;"
# store the results as a dataframe
results2 <- dbSendQuery(projectDb,query2)
skills <- dbFetch(results2)
dbClearResult(results2) # clear the result

head(skills)

# query3: import skill table
query3 <- "SELECT * FROM SKILL;"
# store the results as a dataframe
results3 <- dbSendQuery(projectDb,query3)
skill <- dbFetch(results3)
dbClearResult(results3) # clear the result

head(skill)

# close the db connection
dbDisconnect(projectDb)


# EDA1 - education count by keyword (Josh already did this one)
education_count <- education |>
  group_by(EDUCATION = EDUCATION_KEYWORD) |>
  summarize(TOTAL=sum(COUNT)) |>
  arrange(desc(TOTAL))

# Plot of Degrees of Education Count
ggplot(education_count, aes(x=reorder(EDUCATION, TOTAL),
                            y=TOTAL)) +
  geom_col() +
  coord_flip() + 
  theme_minimal() +
  theme(axis.text.y = element_text(size = 4)) +
  labs(x = "EDUCATION", title="EDUCATION IN DEMAND")

# EDA2 - skill count by category (NOT SKILLS Table)
skill_count <- skill|>
  filter(CATEGORY != '')|>
  count(CATEGORY, name = 'TOTAL')

# EDA3 - Percentage in skills count 
percentage_education_count <- education_count |>
  mutate(PERCENTAGE = (TOTAL/sum(TOTAL))*100)

# skills count by keyword graphic (Josh already did this one)
skills_count <- skills |> 
  group_by(SKILL = SKILL_KEYWORD) |>
  summarize(TOTAL=sum(COUNT)) |>
  arrange(desc(TOTAL))

# EDA4 - Percentage in skills count (NOT SKILL Table)
percentage_skills_count <- skills_count |>
  mutate(PERCENTAGE = (TOTAL/sum(TOTAL))*100)

# EDA5 - Percentage in skill count (NOT SKILLS Table)
percentage_skill_count <- skill_count |>
  mutate(PERCENTAGE = (TOTAL/sum(TOTAL))*100)

