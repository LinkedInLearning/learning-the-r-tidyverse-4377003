library(tidyverse)







# Advanced ----------------------------------------------------------------

msleep %>% 
  mutate(across(contains("sleep"), ~ . / 24))
