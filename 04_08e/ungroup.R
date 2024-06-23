library("tidyverse")

exam_data <- read_csv("data/exam-data.csv")

student_year_averages <- exam_data %>% 
  group_by(student_id, year_group) %>% 
  summarise(avg_score = mean(c_across(contains("score")))) %>% 
  ungroup()

student_year_averages

student_year_averages %>% 
  filter(avg_score == max(avg_score))

