library(readr)

shades <- read_csv("shades.csv")

shades_30 <- shades[1:30, ]

model <- lm(L ~ H, data = shades_30)

summary(model)

plot(shades_30$H, shades_30$L,
     xlab = "Hue (H)",
     ylab = "Lightness (L)",
     main = "Linear Regression: Hue vs Lightness ",
     pch = 19,
     col = "blue")

abline(model, col = "red", lwd = 2)
