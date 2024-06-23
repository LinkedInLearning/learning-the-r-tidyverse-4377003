library("tidyverse")

msleep %>% 
  select(name:order)




msleep %>% 
  select(name, where(is.numeric))



msleep %>% 
  select(name, contains("sleep"))



msleep %>% 
  drop_na(contains("sleep"))



# mutate is a little different --------------------------------------------

msleep %>% 
  mutate(across(contains("sleep"), ~ . / 24))


# filter is very different ------------------------------------------------

msleep %>% 
  filter(if_any(contains("sleep"), ~is.na(.x)))

