library("tidyverse")

msleep %>% 
  mutate(
    sleep_ranking = if_else(sleep_total <= 12, "<= 1/2 a day asleep", "More than half a day's sleep!")
  )



