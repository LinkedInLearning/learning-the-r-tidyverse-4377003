library("tidyverse")

msleep %>% 
  filter(if_all(contains("sleep"),
                ~is.na(.)))


msleep %>% 
  filter(if_all(c(vore, conservation),
                ~is.na(.)))


msleep %>% 
  filter(if_all(contains("wt"),
                ~ . > 1))
