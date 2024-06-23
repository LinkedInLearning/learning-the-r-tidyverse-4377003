library("tidyverse")

billboard %>% 
  filter(str_detect(str_to_lower(track), "love")) %>% 
  filter(if_all(contains("wk"), ~ . <= 80 | is.na(.)))
