## Evaluation 2 Unit 2
**INSTRUCTIONS**

Develop the following problem with R and RStudio for the knowledge extraction that the problem requires.
Implement the K-Means grouping model with the Iris.csv dataset found at https://github.com/jcromerohdz/iris using the kmeans () method in R. Once the grouping model is obtained do the corresponding data visualization analysis.

At the end of the development, explain in detail the K-Means grouping model and what your observations were in data visualization analysis.

### Development

We establish the working environment
```
getwd()
setwd("/Users/Dell/Documents/ITT/MineriaDatos")
getwd()
```

We import the data sets to use
```
dataset = read.csv('iris.csv')
dataset = dataset[1:4]

head(dataset)
```

We use this method to know the optimal number of clusters
```
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')
```

![Grafica](https://raw.githubusercontent.com/manuelorozcotoro/Mineria_De_Datos/Unidad_4/EvaluacionU4/grafica1U4.PNG)

We fit k = 3 to the data set
```
set.seed(29)
kmeans = kmeans(x = dataset, centers = 3)
y_kmeans = kmeans$cluster

# visualizacion de grupos
# install.packages('cluster')
library(cluster)
clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of Iris'),
         xlab = 'Petal.Width',
         ylab = 'Sepal.Width')
```

![Grafica](https://raw.githubusercontent.com/manuelorozcotoro/Mineria_De_Datos/Unidad_4/EvaluacionU4/grafica2U4.PNG)

### Video
https://www.youtube.com/watch?v=tNER74BqS9I&feature=youtu.be&fbclid=IwAR2hkVAz558c9EBTXq9VG8OL6uWwWrOJNa19z33e5yEta9f8aRZCaK9lj1U
