library("tidyverse")
library("palmerpenguins")

penguins_max_dimensions <- penguins %>% 
  group_by(species, island) %>% 
  summarise(max_dimension = max(c_across(ends_with("_mm")),
                                na.rm = TRUE)) %>% 
  ungroup()


penguins_max_dimensions %>% 
  filter(max_dimension > mean(max_dimension))
