library("tidyverse")


# Creating our own factors ------------------------------------------------

msleep %>% 
  count(vore) %>% 
  mutate(vore = fct_na_value_to_level(vore, "Unknown diet")) %>% 
  mutate(vore = fct_reorder(vore, n)) %>% 
  ggplot() +
  aes(x = n,
      y = vore) +
  geom_col()


# Factors that already exist ----------------------------------------------


gss_cat %>% 
  select(rincome) %>% 
  mutate(rincome = fct_collapse(rincome, "Unknown income" = c("Not applicable",
                                                              "No answer",
                                                              "Don't know",
                                                              "Refused"))) %>% 
  count(rincome) %>% 
  ggplot() +
  aes(x = n,
      y = rincome) +
  geom_col()
