# The location of the file has been assigned

getwd()
setwd("C:\\Users\\acer\\Documents\\mineria\\Data")
getwd() 

# Importing the dataset
# The path of the csv file that was worked with was assigned
dataset <- read.csv('EdadPesoGrasas.csv')

names(dataset)
# Divide the data set into the training set and the test set
# Install.packages ('caTools)
library(caTools)
set.seed(123)
split <- sample.split(dataset$peso, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting the simple linear regression to the training set
regressor = lm(formula =  peso ~ edad,
               data = dataset)

summary(regressor)
# 3* means it has a good correlation when we do View (regression)

# Prediction of test set results (to see write y_pred)
y_pred = predict(regressor, newdata = test_set)

# Viewing the results of the training set
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$edad, y=training_set$peso),
             color = 'red') +
  geom_line(aes(x = training_set$edad, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('peso vs edad (Training Set)') +
  xlab('edad') +
  ylab('peso')

# Viewing the results of the test set
ggplot() +
  geom_point(aes(x=test_set$edad, y=test_set$peso),
             color = 'red') +
  geom_line(aes(x = training_set$edad, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('peso vs edad (Test Set)') +
  xlab('peso') +
  ylab('edad')