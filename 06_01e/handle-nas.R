library("tidyverse")

msleep %>% 
  drop_na(contains("sleep"))


msleep %>% 
  replace_na(list(
    conservation = "Unknown conservation",
    vore = "Unknown diet"
  ))

msleep %>% 
  select(name:order) %>% 
  mutate(vore = na_if(vore, "omni"))
