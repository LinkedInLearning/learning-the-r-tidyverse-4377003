library("tidyverse")

starwars_heights_data <- starwars %>% 
  select(species, homeworld, height) 


