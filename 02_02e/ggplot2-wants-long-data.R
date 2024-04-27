library(tidyverse)

un_data_long <- read_csv("data/un_data_long.csv")

un_data_wide <- read_csv("data/un_data_wide.csv")


# Chart: wide -------------------------------------------------------------

un_data_wide %>% 
  ggplot() +
  aes(x = eom) +
  geom_line(aes(y = births,
                colour = country)) +
  geom_line(aes(y = deaths,
                colour = country)) +
  scale_x_date(date_labels = "%b\n%Y",
               breaks = "month")



# Chart: long -------------------------------------------------------------

un_data_long %>% 
  ggplot() +
  aes(x = eom,
      y = value,
      fill = name) +
  geom_area() +
  scale_x_date(date_labels = "%b\n%Y",
               breaks = "month") +
  facet_wrap(~country)

