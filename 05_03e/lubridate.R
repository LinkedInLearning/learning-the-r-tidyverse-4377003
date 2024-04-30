library("tidyverse")
library("janitor")

insurance_data <- read_csv("data/insurance-data.csv") %>% 
  clean_names()

insurance_data %>% 
  mutate(quote_date = mdy(quote_date),
         policy_start_date = dmy(policy_start_date),
         policy_end_date = dmy(policy_end_date)) %>% 
  mutate(policy_length_days = policy_end_date - policy_start_date,
         renewal_reminder_date = policy_end_date - weeks(5))
