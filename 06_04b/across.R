library("tidyverse")

msleep %>% 
  select(name, contains("sleep"))



# rowwise -----------------------------------------------------------------

exam_data <- read_csv("data/exam-data.csv")
