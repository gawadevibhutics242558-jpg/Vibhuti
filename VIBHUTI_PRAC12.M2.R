shades <- read.csv("shades (1).csv")

head(shades)
str(shades)
numeric_data <- shades[sapply(shades, is.numeric)]

head(numeric_data)
correlation_matrix <- cor(numeric_data, use = "complete.obs")

print(correlation_matrix)
rounded_correlation <- round(correlation_matrix, 2)

print(rounded_correlation)
