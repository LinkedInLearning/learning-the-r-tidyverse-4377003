library("tidyverse")

arrange(
  filter(
    mutate(
      select(
        msleep,
        c(name, conservation, sleep_total, sleep_rem)
      ),
      sleep_total_perc = sleep_total / 24
    ),
    !is.na(conservation),
    !is.na(sleep_rem),
    sleep_total_perc < 0.5
  ),
  desc(sleep_rem)
)


msleep %>% 
  select(c(name, conservation, sleep_total, sleep_rem)) %>% 
  mutate(sleep_total_perc = sleep_total / 24) %>% 
  filter(!is.na(conservation),
         !is.na(sleep_rem),
         sleep_total_perc < 0.5) %>% 
  arrange(desc(sleep_rem))
