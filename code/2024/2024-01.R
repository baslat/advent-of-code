# https://adventofcode.com/2024/day/1

library(tidyverse)

# Part 1 ----
input_path <- "data/2024/input-2024-01.txt"

x <- read_delim(input_path, col_names = c("c1", "c2"), delim = "   ")


bind_cols(c1 = sort(x$c1), c2 = sort(x$c2)) |>
	summarise(dist = sum(abs(c2 - c1)))

# Part 2 ----
counts <- count(x, number = c2)

left_join(x, counts, by = join_by(c1 == number)) |>
	summarise(score = sum(c1 * n, na.rm = TRUE))
