
getwd()
setwd("/Users/Dell/Desktop/DM2105/DataMining-master/MachineLearning/RandomForest")
getwd()

# Importando el conjunto de datos

dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

#cCodificar la característica de destino como factor

dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# En este caso están en 0 y 1s

# Dividir el conjunto de datos en el conjunto de entrenamiento y sety de prueba

install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Escalado de funciones

training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# Ajuste de la clasificación aleatoria del bosque al conjunto de capacitación install.packages ('randomForest')

library(randomForest)
set.seed(123)
classifier = randomForest(x = training_set[-3],
                          y = training_set$Purchased,
                          ntree = 10)

# Predecir los resultados del conjunto de pruebas

y_pred = predict(classifier, newdata = test_set[-3])

# Haciendo la matriz de confusión

cm = table(test_set[, 3], y_pred)

# Visualizar los resultados del conjunto de entrenamiento

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

# Visualizar los resultados del conjunto de pruebas

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
Elegir el número de árboles

plot(classifier)

# Result: As you can see graphically, this classifier strives to separate the data into regions gradually, being quite accurate.