library("tidyverse")






# Advanced filter ---------------------------------------------------------

gss_cat %>% 
  filter(if_any(c(relig, denom), ~str_detect(.x, "Other")))
