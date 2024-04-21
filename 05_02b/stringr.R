library("tidyverse")


# filtering strings -------------------------------------------------------


billboard



# tidying strings ---------------------------------------------------------

gss_cat %>%
  count(partyid) %>% 
  ggplot() +
  aes(x = n,
      y = partyid) +
  geom_col()


# str_extract -------------------------------------------------------------

str_extract("data-file_2005.csv", "[0-9]{4}")


data_files <- list.files("data")

str_extract(data_files, "[0-9]{4}")


library("janitor")

read_and_clean <- function(data_file){
  
  data_year <- str_extract(data_file, "[0-9]{4}")
  
  data_file %>% 
    read_csv() %>% 
    mutate(year = data_year) %>% 
    clean_names() %>% 
    pivot_longer(life_exp:gdp_percap)
  
  
}

data_gapminder_data <- map(
  list.files("data", pattern = "gapminder.{1,}.csv", full.names = TRUE),
  ~ read_and_clean(.)
) %>%
  bind_rows()
