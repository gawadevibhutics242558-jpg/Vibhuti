library(dplyr)

wine_df <- read.csv("D:/S079_VIBHUTI/ADV PYTHON FOR DATA SCIENCE/winequality-red.csv")
shades_df <- read.csv("D:/S079_VIBHUTI/ADV PYTHON FOR DATA SCIENCE/shades.csv")

print("--- Column Names Before Alignment ---")
print(names(wine_df))
print(names(shades_df))

wine_clean <- wine_df %>%
  select(quality) %>%
  mutate(Type = "Wine") %>%
  rename(Value = quality)

shades_clean <- shades_df %>%
  select(product) %>%     # <<--- correct column name
  mutate(Type = "Shade") %>%
  rename(Value = product)

combined_data <- rbind(wine_clean, shades_clean)

print("--- Combined Data Preview ---")
print(head(combined_data))
print(tail(combined_data))

print("--- Row Summary ---")
print(paste("Wine rows:", nrow(wine_clean)))
print(paste("Shades rows:", nrow(shades_clean)))
print(paste("Total rows:", nrow(combined_data)))
