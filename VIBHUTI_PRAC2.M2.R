library(dplyr)

df <- read.csv("shades.csv")

print("---- 2. Frequency Tables for Shades Dataset ----")

# Automatically select the first categorical column
cat_var <- names(df)[!sapply(df, is.numeric)][1]

print(paste("Using categorical column:", cat_var))

print("Frequency Table using table():")
print(table(df[[cat_var]]))

print("Frequency Table using count():")
print(df %>% count(.data[[cat_var]]))
