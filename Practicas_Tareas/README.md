**PRACTICES UNIT 2**

**INDEX**

* [T1.-Task 1, Advanced Graphics](#T1)
* [T2.-Task 2, What is Jitter?](#T2)
* [T3.-Task 3, P- Value](#T3)
* [1.-Lineal Regression](#p1)


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
