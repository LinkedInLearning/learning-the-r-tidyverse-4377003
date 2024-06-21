library("tidyverse")

msleep_processed <- msleep %>% 
  mutate(sleep_non_rem = sleep_total - sleep_rem) %>% 
  mutate(sleep_total = sleep_total / 24)





# Advanced ----------------------------------------------------------------

msleep_processed %>% 
  mutate(across(contains("sleep"), ~ . / 24))
