library("tidyverse")

msleep %>% 
  select(name, contains("sleep")) %>% 
  mutate(across(starts_with("sleep"),
                ~ . / 24))

msleep %>% 
  select(name, contains("sleep")) %>% 
  mutate(across(starts_with("sleep"),
                list("percent" = ~ . / 24)))

msleep %>% 
  select(vore, contains("wt")) %>% 
  group_by(vore) %>% 
  summarise(across(contains("wt"),
                   list("max" = ~max(., na.rm = TRUE))))

# rowwise -----------------------------------------------------------------

exam_data <- read_csv("data/exam-data.csv")

exam_data %>% 
  group_by(student_id, year_group) %>% 
  summarise(max_score = max(c_across(contains("score"))))
