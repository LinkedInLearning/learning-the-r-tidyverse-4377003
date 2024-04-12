library("tidyverse")
library("countrycode")
library("maps")
library("gapminder")

names_countries <- codelist %>% 
  filter(continent %in% c("Americas", "Europe")) %>% 
  filter(!country.name.en %in% c("Ukraine", "Russia")) %>% 
  pull(country.name.en)

names_countries %in% c("France")

{set.seed(1)
data_locations <- 
world.cities %>% 
  as_tibble() %>% 
  filter(country.etc %in% names_countries) %>% 
  sample_n(100) %>% 
  mutate(location = str_c(name, country.etc, sep = ", ")) %>% 
  select(location)
}

names_devices <- c("Smart Phone", "VR Headset", "Tablet", "Games Console", "e-reader")

choose_devices <- function(n){
  
  replicate(n, str_flatten(sample(names_devices, as.integer(runif(1, 1, 5))), collapse = ";"))
  
}



{set.seed(1)
data_for_separating <- 
data_locations %>% 
  mutate(devices = choose_devices(nrow(.))) %>% 
  mutate(cust_id = row_number(), .before = 1)
}

data_with_list <- data_for_separating %>% 
  separate_longer_delim(devices,
                        delim = ";") %>% 
  group_by(cust_id) %>% 
  reframe(location, devices_list = list(devices))




data_for_separating %>% 
  write_csv("data/customer-data.csv")



