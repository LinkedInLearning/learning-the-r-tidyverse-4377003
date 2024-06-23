library("tidyverse")

billboard %>%
  count(artist, sort = TRUE)

billboard %>%
  count(artist, date.entered, sort = TRUE)

billboard %>>%
  select(artist:date.entered) %>%
  add_count(artist, name = "times_artist_in_top_100")
