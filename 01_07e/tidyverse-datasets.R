library("tidyverse")
library("vcdExtra")

msleep


datasets("ggplot2") %>% 
  as_tibble()


tidyverse_packages() %>% 
  datasets() %>% 
  as_tibble() %>% 
  view()
