library("tidyverse")

un_data <- read_csv("data/un_data_wide.csv")








un_long %>% 
  ggplot() +
  aes(x = eom,
      y = value,
      colour = country) +
  geom_line() 
