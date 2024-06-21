library("tidyverse")

library("readxl")

read_excel()

ggplot(msleep) +
  aes(x = sleep_total,
      y = sleep_rem) +
  geom_point()
