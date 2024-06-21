library("tidyverse")

midwest %>% 
  select(state, county)

midwest %>% 
  select(1, 2)

midwest %>% 
  select(PID:poptotal, !contains("perc")) %>% 
  select(starts_with("pop"))
