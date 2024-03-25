library("tidyverse")

un_data <- read_csv("data/un_data_wide.csv")


un_data %>% 
  pivot_longer(australia_births:sweden_births)

un_data %>% 
  pivot_longer(contains("births"))


un_data %>% 
  pivot_longer(contains("births"),
               names_to = "country",
               values_to = "births",
               names_sep = "_")





un_long %>% 
  ggplot() +
  aes(x = eom,
      y = value,
      colour = country) +
  geom_line() 
