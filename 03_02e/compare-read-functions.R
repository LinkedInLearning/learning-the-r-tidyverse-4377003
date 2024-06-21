library("tidyverse")

data_baser <- read.csv("data/sample-data.csv")


data_readr <- read_csv("data/sample-data.csv")


data_baser %>% 
  filter(is.na(sex))

data_readr %>% 
  filter(is.na(sex))

# Comparing speed ---------------------------------------------------------

library("tictoc")

tic("How long to wait?")
Sys.sleep(1.5)
toc()

# Data from https://catalog.data.gov/dataset/electric-vehicle-population-data
# Dataset is 41Mb

tic("base r")
data_large_base_r <- read.csv("data/large-csv.csv")
toc()

tic("readr")
data_large_readr <- read_csv("data/large-csv.csv")
toc()