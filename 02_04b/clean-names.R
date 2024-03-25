library("tidyverse")

un_data <- read_csv("data/un_data_wide.csv")





un_long %>% 
  ggplot() +
  aes(x = eom,
      y = births,
      colour = country) +
  geom_line() 
