library("tidyverse")

msleep %>%
  select(name, contains("sleep"), brainwt) %>% 
  mutate(sleep_ranking = if_else(
    sleep_total <= 12,
    "<= 1/2 a day asleep",
    "More than half a day's sleep!"
  ))


msleep %>%
  select(name, contains("sleep"), brainwt) %>% 
  mutate(sleep_category = 
           case_when(
             is.na(brainwt) ~ "Unknown brain weight",
             sleep_total < 4 ~ "Barely any sleep",
             sleep_total < 16 & sleep_rem >= 0.1 * sleep_total ~ "Dreamy sleep",
             TRUE ~ "Other"
           ))
