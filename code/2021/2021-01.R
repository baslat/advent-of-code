library(tidyverse)

# Part 1
## How many measurements are larger than the previous measurement?
input <- readLines("data/input_01.txt")
# Argh! It was read as a character!
input <- as.numeric(input)

# Let's practice not using dataframes
bigger <- (input > dplyr::lag(input, n = 1L))
sum(bigger, na.rm = TRUE)

# Part 2
## Consider sums of a three-measurement sliding window. How many sums are larger than the previous sum?
library(slider)

tibble(depth = input) %>%
    mutate(
        window_sum = slide_sum(depth, after = 2),
        window_bigger = window_sum > lag(window_sum)
    ) %>%
    count(window_bigger)
