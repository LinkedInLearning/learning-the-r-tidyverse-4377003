library("tidyverse")
library("janitor")

un_data <- read_csv("data/un_data_messy.csv")

un_data %>% 
  clean_names() %>% 
  rename(source_year = source_year_1)
