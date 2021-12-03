library(tidyverse)

# How many measurements are larger than the previous measurement?
input <- readLines("data/input_01.txt")
# Argh! It was read as a character!
input <- as.numeric(input)

# Let's practice not using dataframes
bigger <- (input > dplyr::lag(input, n = 1L))
sum(bigger, na.rm = TRUE)
