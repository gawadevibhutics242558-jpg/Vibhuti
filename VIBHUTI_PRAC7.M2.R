library(dplyr)

df <- read.csv("IRIS (1).csv")

str(df)

df$species <- as.factor(df$species)

anova_model <- aov(sepal_length ~ species, data = df)

summary(anova_model)
