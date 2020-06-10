# Establecemos el entorno de trabajo
getwd()
setwd("/Users/Dell/Documents/ITT/MineriaDatos")
getwd()

# Importe los conjuntos de datos para usar
dataset = read.csv('iris.csv')
dataset = dataset[1:4]

head(dataset)
# Utilizamos este metodo para sber el numero optimo de clusters
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')

# Ajustamos k=3 al conjunto de datos
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
