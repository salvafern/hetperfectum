## code to prepare `hetimperfectum` dataset goes here
library(dplyr)

hetperfectum <- read.csv(file.path(".", "data-raw", "hetperfectum.csv"), stringsAsFactors = FALSE) %>% dplyr::select("Infinitief", "Perfectum", "Zijn_of_hebben", "Engels")

usethis::use_data(hetperfectum, overwrite = TRUE)
