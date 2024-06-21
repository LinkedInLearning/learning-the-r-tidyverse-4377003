library("tidyverse")
library("gapminder")

starwars %>% 
  select(name, where(is.list)) %>% 
  mutate(n_films = lengths(films)) %>% 
  unnest(vehicles)





# ADVANCED: Nested models -------------------------------------------------

gapminder_continent_life_exp <- gapminder %>% 
  group_by(continent, year) %>% 
  summarise(life_exp = mean(lifeExp))



gapminder_continent_life_exp %>% 
  select(continent, year, life_exp) %>% 
  group_by(continent) %>%
  nest() 



gapminder_model_continent_life_exp <- gapminder_continent_life_exp %>%
  group_by(continent) %>%
  nest() %>% 
  mutate(model_life_exp = map(data, function(df) {
    lm(life_exp ~ year, data = df)
  })) %>% 
  ungroup()

gapminder_model_continent_life_exp %>% 
  mutate(predictions = pmap(list(model_life_exp, data),
                            ~predict(.x, .y))) %>% 
  select(continent, data, predictions) %>% 
  unnest(c(data, predictions)) %>% 
  pivot_longer(life_exp:predictions) %>% 
  ggplot() +
  aes(x = year,
      y = value,
      colour = name) +
  geom_line() +
  facet_wrap(~ continent)
