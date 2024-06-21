library("tidyverse")


"Hello world" %>% 
  rep(5)

msleep %>%
  count(conservation)

vore_summary <- msleep %>% 
  count(vore) %>% 
  arrange(desc(n))

