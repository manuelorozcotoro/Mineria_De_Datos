# Establecer nuestro ambiente de trabajo

getwd()
setwd("/Users/Dell/Desktop/DM1905/DataMining-master/MachineLearning/SVM")
getwd()

# Importar nuevo conjunto de datos Cambiado a 3: 4 ya que este nuevo conjunto de datos solo contiene 4 columnas

dataset = read.csv('datos.csv')
dataset = dataset[3:4]
# Codifique la caracter�stica objetivo como factor En este caso, la �ltima columna

dataset$cl = factor(dataset$cl, levels = c(0, 1))

# La divisi�n del conjunto de datos en el conjunto de entrenamiento y la biblioteca CaTools del conjunto de prueba se utiliza y la columna se asigna para dividir en este caso "cl"

library(caTools)
set.seed(123)
split = sample.split(dataset$cl, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Funciones de escala para este caso -2

training_set[-2] = scale(training_set[-2])
test_set[-2] = scale(test_set[-2])

# SVM ajustado al conjunto de entrenamiento Se us� la biblioteca e1071 y se us� el clasificador SVM con el n�cleo "sigmoide"

library(e1071)
classifier = svm(formula = cl ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'sigmoid')

# Predicci�n de los resultados del conjunto de pruebas.

y_pred = predict(classifier, newdata = test_set[-2])
y_pred

# Matriz de confusi�n

cm = table(test_set[, 2], y_pred)
cm

# Ver los resultados del conjunto de entrenamiento

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

# Resultado: el gr�fico se comporta de forma curva y lineal tratando de separar los datos de error

# Visualizaci�n de resultados del conjunto de pruebas

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