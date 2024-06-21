library("tidyverse")


class(iris)

group_by(iris, Species) %>% 
  summarise(max_sepal_length = max(Sepal.Length))


as_tibble(mtcars)

starwars

quakes