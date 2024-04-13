library("tidyverse")
library("haven")

# Data from ARDA https://doi.org/10.17605/OSF.IO/TQ23N

survey_data <- read_spss("data/General Social Survey, 1991.SAV")




# Get question text ------------------------------------------------------

survey_data %>% 
  select(where(is.labelled)) %>% 
  map(~attr(.x, "label")) %>% 
  as_tibble() %>% 
  pivot_longer(everything(),
               names_to = "col_name",
               values_to = "question_label")

