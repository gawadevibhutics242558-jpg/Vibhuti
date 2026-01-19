library(ggplot2)

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

coef_table <- as.data.frame(summary(model)$coefficients)

write.csv(coef_table, "D:/S079_VIBHUTI/ADV PYTHON FOR DATA SCIENCE/logistic_model_coefficients.csv", row.names = TRUE)
write.csv(wine, "D:/S079_VIBHUTI/ADV PYTHON FOR DATA SCIENCE/wine_processed.csv", row.names = FALSE)

wine$predicted_prob <- predict(model, type = "response")
write.csv(wine, "D:/S079_VIBHUTI/ADV PYTHON FOR DATA SCIENCE/wine_predictions.csv", row.names = FALSE)

ggplot(wine, aes(x = alcohol, y = as.numeric(high_quality) - 1)) +
  stat_smooth(
    method = "glm",
    method.args = list(family = "binomial"),
    se = FALSE,
    color = "red",
    size = 1.5
  ) +
  geom_point(aes(y = as.numeric(high_quality) - 1), color = "blue", alpha = 0.5) +
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
