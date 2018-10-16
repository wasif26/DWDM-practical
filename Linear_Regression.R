#load supporting library
#library(tidyverse)
library(ggpubr)
theme_set(theme_pubr())

#downloading dataset from Github
devtools::install_github("kassambara/datarium")

#loading dataset
data("marketing", package = "datarium")
head(marketing, 4)

#ploting dataset
ggplot(marketing, aes(x = youtube, y = sales)) +
  geom_point() +
  stat_smooth()

#compute the correlation coefficient between the two variables using the R function cor():
cor(marketing$sales, marketing$youtube)

#simple linear regression 
model <- lm(sales ~ youtube, data = marketing)
model

#add the regression line
ggplot(marketing, aes(youtube, sales)) +
  geom_point() +
  stat_smooth(method = lm)

#Model summary
summary(model)

#Standard errors and confidence intervals:
confint(model)
#Model accuracy with Residual standard error (RSE).
sigma(model)*100/mean(marketing$sales)
