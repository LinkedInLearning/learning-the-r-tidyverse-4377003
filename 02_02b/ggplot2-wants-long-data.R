library(tidyverse)

un_data_long <- read_csv("data/un_data_long.csv")

un_data_wide <- read_csv("data/un_data_wide.csv")


# Chart: wide -------------------------------------------------------------

un_data_wide %>% 
  ggplot() +
  aes(x = eom) +
  scale_x_date(date_labels = "%b\n%Y",
               breaks = "month")



# Chart: long -------------------------------------------------------------

un_data_long %>% 
  ggplot() +
  aes(x = eom) +
  scale_x_date(date_labels = "%b\n%Y",
               breaks = "month")

