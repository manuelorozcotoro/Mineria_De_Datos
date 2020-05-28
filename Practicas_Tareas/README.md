**PRACTICES UNIT 2**

**INDEX**

*Task*
* [T1.-Task 1, Advanced Graphics](#T1)
* [T2.-Task 2, What is Jitter?](#T2)
* [T3.-Task 3, P- Value](#T3)
* [T4.-Task 4, What does glm?](#T4)
* [T5.-Task 5, Library ElementStatLearn](#T5)

*Practices*

* [1.-Lineal Regression](#p1)
* [2.-Multiple Linear Regression (RD.SPEND)](#p2)
* [3.-Multiple Linear Regression (P.Value)](#p3)
* [4.-Logistic rRgression (Explanation)](#p4)
* [5.-Suport Vector Machine ( Change Kernel)](#p5)
* [6.-SVM (Change DataSet)](#p6)
* [7.-Decision tree (Change DataSet)](#p7)
* [8.-Random Forest](#p8)


<a name="T1"></a>
# TASK 1
**Advanced Graphics**
### 1. Combination of multiple graphs

The possibility of combining multiple graphics in the same image facilitates quick visual comparison, 
for example between different variables.

```
plot (iris [, -5], col = iris $ Species)
```
![Imagen]()

```
ggplot(iris, aes(Sepal.Length, Sepal.Width)) + 
  geom_point() + facet_wrap(~Species)
```
![Imagen]()
```
grafica <- ggplot(diamonds, aes(price)) + 
  geom_histogram(bins=20, color="black", fill="yellow") + 
  scale_x_log10()
  
grafica + facet_wrap(~cut, scales = "free_y")
```
![Imagen]()

```
grafica + facet_grid(color~cut, scales = "free_y")  

```
![Imagen]()

### 2. Relations Representation
The pie charts known as circuses facilitate the visualization of percentages and relationships between variables:

```
library(circlize) # We load the necessary package for this graph

```
HairEyeColor # We examined the HairEyeColor dataset

![Imagen]()

```
# We can translate the denominations

attr(HairEyeColor,"dimnames")$Eye <- c("Marrones", "Azules", "Avellana", "Verdes")  
attr(HairEyeColor,"dimnames")$Hair <- c("Negro", "Castaño", "Pelirrojo", "Rubio")  

chordDiagram(HairEyeColor[,,2])

```
![Imagen]()

### 3.  Comparison of different alternatives according to various criteria
Sometimes there are different ways to solve the same problem and the quality of each 
one can be evaluated with different criteria, which makes it difficult to analyze and 
select the best option. The radar or spider type graph is designed for these cases.
```
library('fmsb')  # We load the package where the command is

dat <- data.frame(    # We simulate three methods with five evaluation criteria
  Prec = runif(3, 0, 1),
  Accu  = runif(3, 0, 1),
  Reca    = runif(3, 0, 1),
  AUC       = runif(3, 0, 1),
  Kapp     = runif(3, 0, 1)
  )
rownames(dat) <- c("SVM", "C4.5", "MLP")

radarchart(dat, maxmin = FALSE) # We draw the graph

# We add a legend to indicate the criteria
legend("bottomleft", rownames(dat),
       col = c('black', 'green', 'red'),
       lty = 1:3, lwd = 2, ncol = 1)
```
![Imagen]()
Alternatively, a heatmap graph could also be used.
This is an array in which all possible values are represented, 
assigning a color to each cell based on the corresponding value:

```
heatmap(as.matrix(dat), scale="column", Colv=NA, Rowv=NA)
```
![Imagen]()

### 4. Graphical representation of functions
R is capable of representing any mathematical function, be it a function included in R or
any other that we may need as long as we define it properly. The following are some examples:

```
# Curve from existing functions (sin and cos)
curve(sin, from = -4, to = 4, col = 'blue', lty = 'dotted', lwd = 2,
      ylab='sin(x) vs cos(x)', xname = "Valores de entrada")
curve(cos, from = -4, to = 4, col = 'cyan', lty = 'dashed', lwd = 2, add = TRUE)
legend("topleft", c("sin(x)", "cos(x)"), col = c('blue', 'cyan'),
       lty = c('dotted','dashed'), lwd = 2, ncol = 2)
```
![Imagen]()
```
# Absolute value curve
curve(abs, from = -10, to = 10)
```
![Imagen]()

```
# Curves from polynomials
curve(x^2 - x, lty = 3, lwd = 2, from = -10, to = 10)
curve(x^3 - x^2 + 1, lty = 2, lwd = 2, from = -10, to = 10, add = TRUE)
```
![Imagen]()
```
# From a user-defined parametric function
heart <- function(t) {
  x <- 16 * sin(t)^3
  y <- 13 * cos(t) - 5 * cos(2*t) - 2 * cos(3*t) - cos(4*t)
  c(x,y)
}

mpoints <- matrix(sapply(seq(0,2*pi,0.1), heart), ncol = 2, byrow = TRUE)
plot(mpoints)
lines(mpoints)

```
![Imagen]()


#### 5. Geometry with turtle graphics

We can even generate graphics with algorithmically defined geometries according to the Logo language, known as turtle graphics:
```
library('TurtleGraphics')
## Warning: package 'TurtleGraphics' was built under R version 3.2.5
## Loading required package: grid
turtle_init()
```
![Imagen]()

```
turtle_do({
 		 for(j in 1:45) { for(i in 1:6) {
      turtle_forward(20) turtle_right(360/6) }
    turtle_right(360/45) } })
```
![Imagen]()
![Imagen]()
![Imagen]()


<a name="T2"></a>
# TASK 2
**What is Jitter?**
Add a small amount of noise to a number vector.

Counterintuitively adding random noise to a plot can sometimes make it easier to read. 
Jittering is particularly useful for small datasets with at least one discrete position.

Amount of vertical and horizontal jitter. The jitter is added in both positive and negative directions, 
so the total spread is twice the value specified here.

If omitted, defaults to 40% of the resolution of the data: this means the jitter values will occupy 80% 
of the implied bins. Categorical data is aligned on the integers, so a width or height of 0.5 will spread 
the data so it's not possible to see the distinction between the categories.

Reference: https://ggplot2.tidyverse.org/reference/position_jitter.html


<a name="T3"></a>
# TASK 3
**P- Value**
It is the probability that if the null hypothesis were true, the sampling variations 
would produce an estimate that is further from the hypothetical value than from our estimated data.
- Indicates how likely it is to obtain a result like this if the null hypothesis is true.
- Indicates if we have evidence from the sample, that there is an effect on the sampling.

As the p-value gets smaller, we start to wonder if the null really is true and good, 
maybe we should change our mind (and reject the null hypothesis).

- A P-Value less than 0.05 means that we have evidence of an effect
- If P-Value is greater than 0.05 it means that there is no evidence of an effect
- The significant value of P-Value is also used as 0.1, 0.01, 0.005 but the most common at 0.05.

Reference: https://www.mathbootcamps.com/what-is-a-p-value/


<a name="P1"></a>
# PRACTICE 1
**Lineal Regression**

```
# The location of the file has been assigned

getwd()
setwd("/users/Dell/Desktop/MineriaDatos/Data/")
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
```
According to the results obtained by the graphs, a logical increase in fat is observed in
relation to the weight of a person, so that both have a relationship of dependence on each other.


<a name="T4"></a>
# TASK 4
**What Does glm?**
The glm () function of R allows us to fit linear models of many types, including those we fit with lm (), Poisson models, and the logits we will focus on. The basic syntax for obtaining a linear model is glm (dependent ~ independent1 + independent2, family = binomial (), data = data ").

The first argument is an object of the formula class. To the left of the sign ~ we place the dependent variable and to the right, joined by the sign + the independent ones, if we are not specifying an interaction between variables.

The second, family = binomial (), specifies the probability function that we will use. For logit models it is a binomial function. Within the parentheses the link function can be specified. For the binomial distribution family glm () by default use a logit function. If we are interested in a probit function we should specify link = probit.

The third one points to a data.frame where the data is. The column names in the data.frame must match the variables specified in the formula, although they may contain more variables that will be discarded. In the case of previously doing a data manipulation chained with the operator%>% we use. as an anonymous substitute for data.


<a name="T5"></a>
# TASK 5
**Library ElemStatLearn**
It is a library that uses a set of data published in the book Statistical Learning Elements that contains simulated observations with a nonlinear function in a two-dimensional space (2 predictors).

It is a framework for machine learning based on the fields of statistics and functional analysis.

Statistical learning theory addresses the problem of finding a predictive function based on data. Statistical learning theory has led to successful applications in fields such as computer vision, speech recognition, and bioinformatics.

Source: https://rpubs.com/Joaquin_AR/267926

<a name="P2"></a>
# PRACTICE 2
**Multiple Linear Regression (RD.SPEND)**

*Instructions:*
- Analyze R.DSpend
- Remove the "." and show that it has weight
- Make it with the previous used graphs
- Show graph of real data vs prediction data
- Change variable
- Convert to a simple linear model

Folder Localization
```
getwd()
setwd("/users/Dell/Desktop/DataMining-master/MachineLearning/MultipleLinearRegression/")
getwd()
```
Importing the dataset
```
dataset <- read.csv('50_Startups.csv')
```
Encoding categorical data 
```
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))
```
Splitting the dataset into the Training set and Test set Install.packages('caTools)
```
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```
Fitting Simple Linear Regression to the Training set
```
regressor = lm(formula = Profit ~ R.D.Spend,
               data = dataset)
summary(regressor) 
```
Predicting the Test set results
```
y_pred = predict(regressor, newdata = test_set) 
```
Visualising the Training set results
```
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$R.D.Spend, y=training_set$Profit),
             color = 'black', size=2) +
  geom_line(aes(x = training_set$R.D.Spend, y = predict(regressor, newdata = training_set)),
            color = 'black') +
  ggtitle('Profit vs R.D.Spend (Training Set)') +
  xlab('R.D.Spend') +
  ylab('Profit')
```
Visualising the Test set results
```
ggplot() +
  geom_point(aes(x=test_set$R.D.Spend, y=test_set$Profit),
             color = 'blue', size=2) +
  geom_line(aes(x = training_set$R.D.Spend, y = predict(regressor, newdata = training_set)),
            color = 'black') + ggtitle('Profit vs R.D.Spend (Test Set)') +
  xlab('R.D.Spend') + ylab('Profit')

```
<a name="P3"></a>
# PRACTICE 3
**Multiple Linear Regression (P.Value)**

Instructions: Analyze the follow automation backward elimination function 
```
getwd()
setwd("/users/Dell/Desktop/DataMining-master/MachineLearning/MultipleLinearRegression/")
getwd()
```
Importing the dataset
```
dataset <- read.csv('50_Startups.csv')
```
Encoding categorical data 
```
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))

dataset
```
Splitting the dataset into the Training set and Test set
Install.packages('caTools')
```
library(caTools)

set.seed(123)

split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```

Atomation BackwardElimination Function 
```
backwardElimination <- function(x, sl) {
  numVars = length(x)
  for (i in c(1:numVars)){
```
Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
   
   ```
   regressor = lm(formula = Profit ~ ., data = x)
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    numVars = numVars - 1
  }
  return(summary(regressor))
}

SL = 0.05
training_set
backwardElimination(training_set, SL)


par(mfrow=c(2,2))
plot(regressor) 
```
We see that the Linearity exists and Homoskedacity is present (when the variance of the conditional error to the explanatory variables is constant throughout the observations.)
```
library(car)
vif(regressor) # VIF for each var<4, no multicollinearity , Thus we conclude that assumptions hold true
```
Backward Elimination
First iteration (remove State)
```
regressor = lm(formula = Profit ~ `R.D.Spend` + Administration + `Marketing.Spend`,
               data = training_set)
summary(regressor)
```
Second iteration (Remove administration)
```
regressor = lm(formula = Profit ~ `R.D.Spend` + `Marketing.Spend`,
               data = training_set)

summary(regressor)
```
Third iteration (Remove Marketing spend)
```
regressor <- lm(formula = Profit ~ `R.D.Spend`,
                data = training_set)
```
summary(regressor)
```
We will consider Marketing spend in the model since it is very close to the significance level of 0.05 as well including it increases the R- Sqaured
Final
```
regressor = lm(formula = Profit ~ `R.D.Spend` + `Marketing.Spend`,data = training_set)
summary(regressor)
```

y_pred = predict(regressor, newdata = test_set)
y_pred
test_set$Profit
plot(y_pred, test_set$Profit)

```
<a name="P4"></a>
# PRACTICE 4
**Logistic Regression (Explanation)**

The csv file is searched from its path
```
getwd()
setwd("/Users/Dell/Desktop/DataMining-master/MachineLearning/LogisticRegression")
getwd()
```
The dataset with which you will work is imported
```
dataset <- read.csv('Social_Network_Ads.csv')
```
The fields with which we will work are selected
```
dataset <- dataset[, 3:5]
```
Division of the data set in the training set
and the test set
The "caTools" package is activated
A training and test set is selected using
package caTools, set.seed (0) is the seed of the generator
money random numbers. The training set corresponds
to 75% of the dataset and is chosen randomly.
```
library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)
```
Scale features
For classification, it is better to do the characteristic scaling (normalization)
```
training_set[, 1:2] <- scale(training_set[, 1:2])
test_set[, 1:2] <- scale(test_set[, 1:2])
```

Fitting the logistic regression to the training set
the linear regression model is applied using
the glm (generalized linear model) function
```
classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = training_set)
```
Predict the results of the test set
```
prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
prob_pred
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred
```
Making the Matrix of Confusion
It is performed to compare the amount of data matched by the model.
```
cm = table(test_set[, 3], y_pred)
cm
```
The data rate correct by
each model made for Purchased 0 and 1.

We use the ggplo2 library to make graphical plots
```
library(ggplot2)
```
The linear functions are shown in the graph
provided by each model.
```
ggplot(training_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
```
This graph shows a curve between purchases with respect to the year
```
ggplot(training_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
```
This graph shows the purchases with respect to the estimated salary of the test set
So the line tends to be straighter but rising
```
ggplot(test_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
```
Similar behavior is observed with the purchasing test set for the year
to the training set
```
ggplot(test_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)
```
Visualization of the result of the training set
The "ElemStatLearn" aquete was installed
```
install.packages(path_to_source, repos = NULL, type="source")
install.packages("~/Downloads/ElemStatLearn_2015.6.26.2.tar", repos=NULL, type="source")
```
The installed library was used
A plot was made with it
showing the previous tests of the training set in K-Neighbors form
serves to reduce the dimensionality of the data.
```
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
Viewing the test data result
```
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

```

<a name="P5"></a>
# PRACTICE 5
**Suport Vector Machine (Change Kernel)**
Instructions: Change Kernel of code in R “support_Vector_Machine.R”
Code

```
# Support Vector Machines (SVM)
# The path of the file to be used is marked according to its location
getwd()
setwd("/Users/Dell/Desktop/DM2105/DataMining-master/MachineLearning/SVM")
getwd()

# Import the data file
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

# The target feature is encoded as a factor to have columns at 0 and 1.
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# The caTools package was installed
# with the following statement: install.packages ('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature scaling
# To make it take all the data except for the 3rd column
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

#Check the documentation to find out what Kernel options SVM accepts
?svm()

# SVM fit to training set
# Package e1072 install.packages ('e1071') was installed
# Changed from "Linear" to "polynomial"
library(e1071)
classifier = svm(formula = Purchased ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'polynomial')
# Predict the results of the test set
y_pred = predict(classifier, newdata = test_set[-3])
y_pred
# Making the confusion matrix
cm = table(test_set[, 3], y_pred)
cm
# When changing to Polomial increased 1 error from 20 (Linear) to 21 (Polinomial)
# and in terms of estimation decreased from 2 80 (Linear) to 78 (Polynomial)
# Display of training data results

library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'SVM (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

#Result: The graph behaves in a curved and linear way trying to separate the error data

# Display of test data results
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'SVM (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

```

<a name="P6"></a>
# PRACTICE 6
**SVM (Change DataSet)**
The dataset to be used only contains data of "x" and "y" as well as a binary column that shows whether or not there are centiliters "cl".

Establish our work environment
```
getwd()
setwd("/Users/Dell/Desktop/DM1905/DataMining-master/MachineLearning/SVM")
getwd()
```
Import new dataset
Changed to 3: 4 since this new dataset only contains 4 columns
```
dataset = read.csv('datos.csv')
dataset = dataset[3:4]
```

Code the target characteristic as a factor
In this case the last column

```
dataset$cl = factor(dataset$cl, levels = c(0, 1))
```

Division of the data set into the training set and the test set
CaTools library is used and column is assigned to split in this case “cl”

```
library(caTools)
set.seed(123)
split = sample.split(dataset$cl, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```

Scale features for this case -2

```
training_set[-2] = scale(training_set[-2])
test_set[-2] = scale(test_set[-2])
```

SVM fit to training set
The e1071 library was used and the SVM classifier with kernel “sigmoid” was used

```
library(e1071)
classifier = svm(formula = cl ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'sigmoid')
```

Prediction of test set results

```
y_pred = predict(classifier, newdata = test_set[-2])
y_pred
```

Confusion matrix

```
cm = table(test_set[, 2], y_pred)
cm
```

Viewing the results of the training set

```
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('x', 'y')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'SVM (Training set)',
     xlab = 'x', ylab = 'y',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 2] == 1, 'green4', 'red3'))
```
Result: The graph behaves in a curved and linear way trying to separate the error data

Viewing test set results

```
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('x', 'y')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'SVM (Test set)',
     xlab = 'x', ylab = 'y',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 2] == 1, 'green4', 'red3'))
```

<a name="P7"></a>
# PRACTICE 7
**SVM (Change DataSet)**
The usable dataset contains data for "x" and "y" as well as a binary column that shows whether or not there are centiliters "cl"

We establish the work environment
```
getwd()
setwd("/Users/Dell/Desktop/DM2005/DataMining-master/MachineLearning/DesicionThree")
getwd()
```

Import the data sets to use
Changed to 3: 4 since this new dataset only contains 4 columns

```
dataset = read.csv('datos.csv')
dataset = dataset[3:4]
```

Code the target characteristic as a factor
In this case the last column
```
dataset$cl = factor(dataset$cl, levels = c(0, 1))
```
Division of the data set into the training set and the test set
CaTools library is used and column is assigned to split in this case “cl”
```
library(caTools)
set.seed(123)
split = sample.split(dataset$cl, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```
Scale features for this case -2
```
training_set[-2] = scale(training_set[-2])
test_set[-2] = scale(test_set[-2])
```

SVM fit to training set
The rpart library was used and the rpart tree classifier was implemented
```
library(rpart)
classifier = rpart(formula = cl ~ .,
                   data = training_set)
```
Prediction of test set results

```
y_pred = predict(classifier, newdata = test_set[-2], type = 'class')
y_pred
```
Confusion matrix
```
cm = table(test_set[, 2], y_pred)
cm
```

Viewing the results of the training set

```
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 1]) - 1, max(set[, 1]) +1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('x', 'y')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3],
     main = 'Decision Tree Classification (Training set)',
     xlab = 'x', ylab = 'y',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 2] == 1, 'green4', 'red3'))
```
Viewing test set results
```
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('x', 'y')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3], main = 'Decision Tree Classification (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 2] == 1, 'green4', 'red3'))
```

Tree plot

```
plot(classifier)
text(classifier)
```

Result: The data were arranged by sections according to the division of the data according to both columns "x" and "y"

```
```
<a name="P8"></a>
# PRACTICE 8
**Random Forest**

Random Forest Classification
```
getwd()
setwd("/Users/Dell/Desktop/DM2105/DataMining-master/MachineLearning/RandomForest")
getwd()
```
Importing the dataset
```
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]
```
Encoding the target feature as factor
```
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```
In this case are in 0 and 1s

Splitting the dataset into the Training set and Test sety
```
install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```
Feature Scaling

```
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```
Fitting Random Forest Classification to the Training set install.packages('randomForest')
```
library(randomForest)
set.seed(123)
classifier = randomForest(x = training_set[-3],
                          y = training_set$Purchased,
                          ntree = 10)
```
Predicting the Test set results
```
y_pred = predict(classifier, newdata = test_set[-3])
```
Making the Confusion Matrix
```
cm = table(test_set[, 3], y_pred)
```
Visualising the Training set results
```
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, grid_set)
plot(set[, -3],
     main = 'Random Forest Classification (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
Visualising the Test set results
```
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, grid_set)
plot(set[, -3], main = 'Random Forest Classification (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
Choosing the number of trees
```
plot(classifier)

Result: As you can see graphically, this classifier strives to separate the data into regions gradually, being quite accurate.

