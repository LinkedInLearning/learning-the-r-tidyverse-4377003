library("tidyverse")
library("gapminder")

starwars



# Nested data -------------------------------------------------------------

gapminder %>%
  group_by(country, continent) %>%
  nest() %>% 
  mutate(model_pop = map(data, function(df) {
    lm(pop ~ year, data = df)
  }))

