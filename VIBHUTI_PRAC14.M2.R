library(ggplot2)
library(dplyr)

wine <- read.csv("D:/S079_VIBHUTI/ADV PYTHON FOR DATA SCIENCE/winequality-red.csv")

names(wine) <- tolower(names(wine))
names(wine) <- gsub("_", ".", names(wine))

wine$high_quality <- ifelse(wine$quality >= 7, 1, 0)
wine$high_quality <- as.factor(wine$high_quality)

model <- glm(
  high_quality ~ alcohol,
  data = wine,
  family = binomial
)

summary(model)

ggplot(wine, aes(x = alcohol, y = as.numeric(high_quality) - 1)) +
  stat_smooth(
    method = "glm",
    method.args = list(family = "binomial"),
    se = FALSE,
    color = "red",
    size = 1.5
  ) +
  labs(
    x = "Alcohol",
    y = "Probability of High Quality Wine",
    title = "Logistic Regression: Alcohol vs High Quality Wine"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    axis.title = element_text(face = "bold")
  )
