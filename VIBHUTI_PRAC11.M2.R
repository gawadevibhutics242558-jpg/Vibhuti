library(ggplot2)

iris_data <- read.csv("C:/Users/ASUS/Downloads/IRIS (1).csv")

head(iris_data)
str(iris_data)

ggplot(iris_data, aes(x = sepal_length)) +
  geom_histogram(binwidth = 0.3) +
  labs(
    title = "Histogram of Sepal Length",
    x = "Sepal Length",
    y = "Frequency"
  ) +
  theme_minimal()
ggplot(iris_data, aes(x = sepal_length)) +
  geom_histogram(binwidth = 0.3) +
  facet_wrap(~ species) +
  labs(
    title = "Histogram of Sepal Length by Species",
    x = "Sepal Length",
    y = "Frequency"
  ) +
  theme_minimal()
ggplot(iris_data, aes(y = sepal_length)) +
  geom_boxplot() +
  labs(
    title = "Box Plot of Sepal Length",
    y = "Sepal Length"
  ) +
  theme_minimal()
ggplot(iris_data, aes(x = species, y = sepal_length)) +
  geom_boxplot() +
  labs(
    title = "Box Plot of Sepal Length by Species",
    x = "Species",
    y = "Sepal Length"
  ) +
  theme_minimal()
