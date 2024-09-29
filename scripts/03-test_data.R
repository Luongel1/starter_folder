#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Elizabeth Luong
# Date: 19 September 2024
# Contact: elizabethh.luong@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


# Load necessary library
library(readr)

# Load the data from the saved CSV file
data_path <- 'data/analysis_data/simulated_marriage_data.csv'
df <- read_csv(data_path)

# Test 1: Check Column Names
test_column_names <- function(df) {
  expected_columns <- c("_id", "CIVIC_CENTRE", "MARRIAGE_LICENSES", "TIME_PERIOD")
  actual_columns <- colnames(df)
  
  # Assert that column names are as expected
  stopifnot(identical(actual_columns, expected_columns))
  
  print("Test 1 passed: Column names are correct.")
}

# Test 2: Validate Civic Centres and Marriage Licenses
test_civic_centres_and_licenses <- function(df) {
  valid_civic_centres <- c('ET', 'NY', 'SC', 'TO', 'YK')
  
  # Assert that all CIVIC_CENTRE values are in valid_civic_centres
  stopifnot(all(df$CIVIC_CENTRE %in% valid_civic_centres))
  
  # Assert that all MARRIAGE_LICENSES values are non-negative
  stopifnot(all(df$MARRIAGE_LICENSES >= 0))
  
  print("Test 2 passed: Civic centres and marriage license numbers are valid.")
}

# Run the tests
test_column_names(df)
test_civic_centres_and_licenses(df)
