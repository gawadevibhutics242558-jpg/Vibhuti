library(dplyr)

df <- winequality.red

str(df)

df$quality <- as.factor(df$quality)
df$alcohol_group <- as.factor(ifelse(df$alcohol > median(df$alcohol), "High", "Low"))

anova_model <- aov(fixed.acidity ~ quality * alcohol_group, data = df)

summary(anova_model)
