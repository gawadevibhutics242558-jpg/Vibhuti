library(dplyr)

shdes <- read.csv("shades.csv")  

head(shdes)

print("---- 5. Independent Two-Sample t-test ----")

num_var <- "H"       
binary_var <- "group" 


if(length(unique(shdes[[binary_var]])) > 2){
  shdes[[binary_var]] <- ifelse(shdes[[binary_var]] > median(shdes[[binary_var]]), "High", "Low")
}
shdes[[binary_var]] <- as.factor(shdes[[binary_var]])

t_test_two <- t.test(shdes[[num_var]] ~ shdes[[binary_var]])

print(t_test_two)
