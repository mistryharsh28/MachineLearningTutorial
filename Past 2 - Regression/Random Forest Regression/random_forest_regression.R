# Random forest Regression

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

# Fitting Random forest Regression to the dataset
# install.packages('randomForest')
library(randomForest)
set.seed(1234)
regressor = randomForest(x = dataset[1],
                         y = dataset$Salary,
                         ntree = 500)

# Predicting a new result
y_pred = predict(regressor, newdata = data.frame(Level = 6.5))

# Visualising Random forest Regression results (For higher Resolution and smoother curve)
library(ggplot2)
X_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = X_grid, y = predict(regressor, newdata = data.frame(Level = X_grid))),
            colour = 'blue') +
  ggtitle('Truth vs Bluff(Random Forest Regression)') + 
  xlab('Level') +
  ylab('Salary')