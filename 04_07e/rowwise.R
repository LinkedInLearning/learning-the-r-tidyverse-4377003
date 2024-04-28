library("tidyverse")

exam_data <- read_csv("data/exam-data.csv")

exam_data %>% 
  rowwise() %>% 
  mutate(max_score = max(score_music:score_science))

exam_data %>% 
  rowwise() %>% 
  mutate(max_score = max(c_across(starts_with("score_"))))

exam_data %>% 
  group_by(student_id) %>% 
  summarise(max_score = max(c_across(starts_with("score"))))
