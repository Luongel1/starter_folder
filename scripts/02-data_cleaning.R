#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Elizabeth Luong
# Date: 19 September 2024
# Contact: elizabethh.luong@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")


cleaned_data <-
  raw_data |>
  janitor::clean_names() |> 
  separate(col = time_period,
           into = c("year", "month"),
           sep = "-") |> 
  mutate(date = lubridate::ymd(paste(year, month, "01", sep = "-"))
  )
<<<<<<< HEAD
=======

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
th_mm, wing_length_mm, flying_time_sec_first_timer) |>
  filter(wing_width_mm != "caw") |>
  mutate(
    flying_time_sec_first_timer = if_else(flying_time_sec_first_timer == "1,35",
                                   "1.35",
                                   flying_time_sec_first_timer)
  ) |>
  mutate(wing_width_mm = if_else(wing_width_mm == "490",
                                 "49",
                                 wing_width_mm)) |>
  mutate(wing_width_mm = if_else(wing_width_mm == "6",
                                 "60",
                                 wing_width_mm)) |>
  mutate(
    wing_width_mm = as.numeric(wing_width_mm),
    wing_length_mm = as.numeric(wing_length_mm),
    flying_time_sec_first_timer = as.numeric(flying_time_sec_first_timer)
  ) |>
  rename(flying_time = flying_time_sec_first_timer,
         width = wing_width_mm,
         length = wing_length_mm
         ) |> 
  tidyr::drop_na()
>>>>>>> 4eb8cc29a4d3256df8c31f218ab87f87059ea7b6

#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
