library(dplyr)

df <- read.csv("IRIS (1).csv")

str(df)

df$sepal_length_group <- cut(
  df$sepal_length,
  breaks = c(4, 5, 6, 8),
  labels = c("Small", "Medium", "Large")
)

table_species_sepal <- table(df$species, df$sepal_length_group)

table_species_sepal

chi_result <- chisq.test(table_species_sepal)

chi_result
