library(quarto)
library(purrr)

files <- list.files()
files <- files[grepl(".qmd", files)]

map(.x = files, .f = \(x) quarto_render(input = x, profile = "single", output_format = "docx"))

    