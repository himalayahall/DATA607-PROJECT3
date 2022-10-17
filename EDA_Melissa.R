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

# query3: import skill table
query3 <- "SELECT * FROM SKILL;"
# store the results as a dataframe
results3 <- dbSendQuery(projectDb,query3)
skill <- dbFetch(results3)
dbClearResult(results3) # clear the result

head(skill)

# close the db connection
dbDisconnect(projectDb)


# EDA1 - education count by keyword
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


# EDA1 - skill count by category (in dataframe)

skill_count <- data.frame(table(skill$CATEGORY))

skill_count <- skill_count[-1, ]

colnames(skill_count)[which(names(skill_count) == "Var1")] <- "SKILL TYPE"

colnames(skill_count)[which(names(skill_count) == "Freq")] <- "Count"


# EDA2 - skill count by category (just count)

skill |>
  filter(CATEGORY == "SOFT") |>
  arrange(desc(SKILL_KEYWORD)) |>
  summarise(Soft_Skill_Count = n())

skill |>
  filter(CATEGORY == "T_GENERAL")|>
  arrange(desc(SKILL_KEYWORD)) |>
  summarise(General_Skill_Count = n())

skill |>
  filter(CATEGORY == "T_SOFTWARE")|>
  arrange(desc(SKILL_KEYWORD)) |>
  summarise(Software_Skill_Count = n())


