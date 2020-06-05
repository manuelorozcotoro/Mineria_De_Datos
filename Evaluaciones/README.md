# Description of Evaluations
**INDEX**

* [E2.-Evaluation 2](#eu2)
* [E3.-Evaluation 3](#eu3)


<a name="eu2"></a>


## Evaluation 2 Unit 2
**INSTRUCTIONS**

The directors of the movie review website are very happy with their previous delivery and now they have a new requirement for you.
The previous consultant had created a chart for them that is illustrated in the following image.

![Grafica1](https://raw.githubusercontent.com/manuelorozcotoro/Mineria_De_Datos/Unidad_2/Evaluaciones/Grafica1.PNG)


However the R code used to create the graph has been lost and cannot be recovered.

Your task is to create the code that will re-create the same table making it look as close to the original as possible.
You will be provided with a new dataset.
Hint Please note that not all Genres and Studio are used. You will need to filter your dataframe after importing the csv file.
Evaluation instructions - Delivery time 4 days - At the end put the source code and the explanation in the corresponding branch of your github and also make your explanation of the solution on your google drive. - Finally defend its development in a video of 8-10 min which will serve to give its rating, this video must be uploaded to YouTube to be shared by a link.


### Development

We establish the working environment

```
getwd()
setwd("C:\\Users\\acer\\Documents\\mineria\\DataMining-master\\Datasets")
getwd()
```

We import the data file

```
movies <- read.csv("Project-Data.csv")
```

We print the first values of the columns

```
head(movies)
```

We filter the specific Genres and Studies to be used
A single line of code was used in which we use AND "&" and OR "|" operators

```
myfilter<- movies[((movies$Genre=="action") | (movies$Genre=="animation") | (movies$Genre=="adventure") | (movies$Genre=="comedy") | (movies$Genre=="drama")) & ((movies$Studio== "Buena Vista Studios") | (movies$Studio== "Fox") | (movies$Studio=="Paramount Pictures") | (movies$Studio=="Sony") | (movies$Studio=="Universal") | (movies$Studio=="WB")), ]
```

Aestetics: We use the ggplot2 library to visualize with its properties

```
library(ggplot2)
```

We create the graphical scheme with ggplot
On the x-axis for "Genre", and for "Gross ... US"
We assign the above to the object "v"

```
v <-ggplot(myfilter, aes(x=Genre, y=Gross...US, 
                         color=Studio, size=Budget...mill.)) +
  xlab("Genre") +
  ylab("Gross % US") + ggtitle("Domestic Gross % by Genre") +
  theme(axis.title.x = element_text(color = "purple", size=12),
        axis.title.y = element_text(color = "purple", size=12))
```

We add to the object "v" the characteristics aestethisc using geom_jitter and geom_boxplot
Showing the final result

```
v + geom_jitter(aes(colour = Studio)) + geom_boxplot( size=0.1,  alpha=0.7, aes(colour = Budget...mill.))
```

final score

![Grafica2](https://raw.githubusercontent.com/manuelorozcotoro/Mineria_De_Datos/Unidad_2/Evaluaciones/Grafica2.PNG) 


### Final conclusion
The comedy genre is the most profitable according to the results
since the boxplot is in a higher position
compared to other genres
If in the future you want to use this graphic result
for the production of a film, the best option
would be to produce one of "Comedy"
in addition to having better profitability it has little competition
unlike "action" or "animation" movies

### Video
https://www.youtube.com/watch?v=3pb3DF1frwc



<a name="eu3"></a>


## Evaluation 3 - Unit 3

* We define the file path to use "Socual_Network_Ads.csv"
```

dataset = read.csv('/Users/Dell/Documents/ITT/MineriaDatos/Social_Network_Ads.csv')
```

* We select the data after the age and salary found in columns 3-5
```

dataset = dataset[3:5]
```

* We show a summary of the data
```

summary(dataset)

head(dataset)
```

* We do the coding of the destination function for the categorical variable as a factor
```

dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))
```
* We observe the results with a summary of the dataset
```

summary(dataset)
```

* We divide the data set into the training set and the test set
* 75% for the split ratio; 75% for training and 25% for testing
* We activate the caTools library
```

library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
```


* We scale the characteristics for classification
```

training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])
```


* We use Head to see the scaling result
```
head(training_set)
```


We adapt Bayes to the training set We need x, y
* x will be the independent variables
* Therefore we eliminate column 3 that we do not need
* y is the dependent variable.
* We activate the e1071 library
```

library(e1071)
classifier = naiveBayes(x = training_set[-3],
                        y = training_set$Purchased)
```

* We predict the results of the test set - Naive Bayes
```

y_pred = predict(classifier, newdata = test_set[-3])
```

* We can see this because it is only yes / no
```

y_pred
```

* We make the matrix of confusion - Naive Bayes
```

cm = table(test_set[, 3], y_pred)
cm
```

* We visualize the training results - Naive Bayes
```

library(ElemStatLearn)
```

* We declare a training set
```

set = training_set
```

* Create the red / green background region. L
```

X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
```

* We name the columns of X and Y
```

colnames(grid_set) = c('Age', 'EstimatedSalary')
```

* Usamos el clasificador para predecir el resultado de cada uno de los bits de píxeles mencionados anteriormente
```

y_grid = predict(classifier, newdata = grid_set)
```

* Plot the actual data graphically
```

plot(set[, -3],
     main = 'Naive Bayes (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2)) 
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
```

* We review all the y_pred data and use if else to color the points
```

points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```

* We visualize the test set results - Naive Bayes
```

library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'SVM Radial Kernel (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
final score

![Grafica3](https://raw.githubusercontent.com/manuelorozcotoro/Mineria_De_Datos/Unidad_2/Evaluaciones/graficaE3.PNG)

### Video
https://youtu.be/bb1TK7mKLbY
