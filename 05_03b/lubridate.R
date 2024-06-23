library("tidyverse")
library("janitor")

insurance_data <- read_csv("data/insurance-data.csv") %>% 
  clean_names()

insurance_data
