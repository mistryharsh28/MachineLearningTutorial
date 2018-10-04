# Regression Template

#Importing Dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# #Spilliting data into Training set and test set
# #install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Purchased, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Fitting Regression Model to the dataset
# Creste your regressor here

# Predicting a new result with Regression Model
y_pred = predict(regressor, newdata = data.frame(Level = 6.5))

# Visualising Regression Model results
library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth vs Bluff(Regression Model)') + 
  xlab('Level') +
  ylab('Salary')

# Visualising Regression Model results (For higher Resolution and smoother curve)
library(ggplot2)
X_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = X_grid, y = predict(regressor, newdata = data.frame(Level = X_grid))),
            colour = 'blue') +
  ggtitle('Truth vs Bluff(Regression Model)') + 
  xlab('Level') +
  ylab('Salary')