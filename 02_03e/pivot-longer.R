library("tidyverse")

un_data <- read_csv("data/un_data_wide.csv")

un_data %>% 
  pivot_longer(births_australia:births_sweden)

un_long <- un_data %>% 
  pivot_longer(contains("births"),
               names_to = "country",
               values_to = "births",
               names_prefix = "births_")


un_long %>% 
  ggplot() +
  aes(x = eom,
      y = births,
      colour = country) +
  geom_line() 

un_long %>% 
  pivot_wider(names_from = "country",
              values_from = "births")
