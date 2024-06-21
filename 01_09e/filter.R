library("tidyverse")


gss_cat %>% 
  filter(age >= 30,
         str_detect(rincome, "[$]")) %>% 
  filter(between(year, 2005, 2010)) %>% 
  filter(!is.na(tvhours))



# Advanced filter ---------------------------------------------------------

gss_cat %>% 
  filter(if_all(c(relig, denom), ~str_detect(.x, "Other")))
