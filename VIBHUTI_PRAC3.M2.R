df <- read.csv("shades.csv")

print("---- 3. Cross-Tabulation for Shades Dataset ----")

cat_vars <- names(df)[!sapply(df, is.numeric)]

cross_tab <- table(df[[cat_vars[1]]], df[[cat_vars[2]]])

print(cross_tab)
