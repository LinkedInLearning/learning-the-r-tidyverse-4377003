library("tidyverse")


# Creating our own factors ------------------------------------------------

msleep %>% 
  count(vore) %>% 
  ggplot() +
  aes(x = n,
      y = vore) +
  geom_col()


# Factors that already exist ----------------------------------------------


gss_cat %>% 
  count(rincome) %>% 
  ggplot() +
  aes(x = n,
      y = rincome) +
  geom_col()
