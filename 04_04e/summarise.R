library("tidyverse")

starwars %>% 
  select(species, homeworld, height) %>% 
  group_by(species, homeworld) %>% 
  summarise(max_height = max(height, na.rm = TRUE)) %>% 
  ungroup()


starwars %>% 
  select(species, homeworld, height) %>% 
  group_by(species, homeworld) %>% 
  summarize(max_height = max(height, na.rm = TRUE)) %>% 
  ungroup()

starwars %>% 
  select(species, homeworld, height) %>% 
  group_by(species) %>% 
  mutate(max_height = max(height, na.rm = TRUE))


