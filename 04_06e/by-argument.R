library("tidyverse")


starwars %>%
  select(name, species, homeworld, where(is.numeric)) %>%
  group_by(species, homeworld) %>%
  summarise(mean_height = mean(height, na.rm = TRUE))


starwars %>%
  select(name, species, homeworld, where(is.numeric)) %>%
  summarise(mean_height = mean(height, na.rm = TRUE),
            .by = c(species, homeworld))
