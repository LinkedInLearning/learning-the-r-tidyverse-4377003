library("tidyverse")

starwars %>% 
  select(name, species, homeworld, where(is.numeric)) %>% 
  group_by(species, homeworld) %>% 
  summarise(mean_height = mean(height, na.rm = TRUE),
            density = mass / height)

starwars %>% 
  select(name, species, homeworld, where(is.numeric)) %>% 
  group_by(species, homeworld) %>% 
  reframe(mean_height = mean(height, na.rm = TRUE),
          density = mass / height)

starwars %>% 
  select(name, species, homeworld, where(is.numeric)) %>% 
  group_by(species, homeworld) %>% 
  mutate(mean_height = mean(height, na.rm = TRUE),
         density = mass / height)
