library("tidyverse")
library("janitor")

vec_data_files <- list.files("data", full.names = TRUE)

vec_data_files %>% 
  map_df(~read_csv(.x))

# Realistic use of purrr -------------------------------------------------------


read_and_clean <- function(data_file){
  
  data_year <- str_extract(data_file, "[0-9]{4}")
  
  data_file %>% 
    read_csv() %>% 
    mutate(year = data_year) %>% 
    clean_names() 
  
}

data_gapminder <- vec_data_files %>% 
  map_df(~read_and_clean(.x))


plot_continent <- function(continent_name){
  
  data_gapminder %>% 
    filter(continent == continent_name) %>% 
    group_by(continent, year) %>% 
    summarise(mean_life_exp = mean(life_exp)) %>% 
    ggplot() +
    aes(x = year,
        y = mean_life_exp,
        group = continent) +
    geom_line() +
    labs(title = str_glue("Life expectancy changes in {continent_name} since 1952"))
  
}

plot_continent("Europe")

data_gapminder %>% 
  distinct(continent) %>% 
  pull(continent) %>% 
  walk(~ggsave(str_glue("life-expectancy-for-{.x}.png"),
               plot_continent(.x)))

