library("tidyverse")

data_customers <- read_csv("data/customer-data.csv")

data_customers %>% 
  separate_wider_delim(location,
                       delim = ", ",
                       names = c("city", "country")) %>% 
  separate_longer_delim(devices,
                        delim = ";")
