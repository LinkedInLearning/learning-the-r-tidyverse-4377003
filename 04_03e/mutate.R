library("tidyverse")

starwars %>% 
  select(name, homeworld, species, where(is.numeric)) %>% 
  group_by(homeworld, species) %>% 
  mutate(earliest_birth_year = min(birth_year, na.rm = TRUE)) %>% 
  ungroup()
