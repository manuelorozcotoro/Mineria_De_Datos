# El archivo csv se busca desde su ruta

getwd()
setwd("/Users/Dell/Desktop/DataMining-master/MachineLearning/LogisticRegression")
getwd()

# Se importa el conjunto de datos con el que trabajar�.

dataset <- read.csv('Social_Network_Ads.csv')

# Se seleccionan los campos con los que trabajaremos.

dataset <- dataset[, 3:5]

# Divisi�n del conjunto de datos en el conjunto de entrenamiento y el conjunto de prueba El paquete "caTools" se activa Un conjunto de entrenamiento y prueba se selecciona usando el paquete caTools, set.seed (0) es la semilla de los n�meros aleatorios de dinero del generador. El conjunto de entrenamiento corresponde al 75% del conjunto de datos y se elige al azar.

library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Caracter�sticas de escala Para la clasificaci�n, es mejor hacer la escala caracter�stica (normalizaci�n)

training_set[, 1:2] <- scale(training_set[, 1:2])
test_set[, 1:2] <- scale(test_set[, 1:2])

# Al ajustar la regresi�n log�stica al conjunto de entrenamiento, el modelo de regresi�n lineal se aplica utilizando la funci�n glm (modelo lineal generalizado)

classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = training_set)

# Predecir los resultados del conjunto de prueba

prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
prob_pred
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred

# Haciendo la Matriz de Confusi�n Se realiza para comparar la cantidad de datos emparejados por el modelo.

cm = table(test_set[, 3], y_pred)
cm

# La velocidad de datos correcta para cada modelo realizado para Comprado 0 y 1.
# Usamos la biblioteca ggplo2 para hacer gr�ficos.

library(ggplot2)

# Las funciones lineales se muestran en el gr�fico proporcionado por cada modelo.

ggplot(training_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

# Este gr�fico muestra una curva entre compras con respecto al a�o

ggplot(training_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

# Este gr�fico muestra las compras con respecto al salario estimado del conjunto de pruebas. Por lo tanto, la l�nea tiende a ser m�s recta pero ascendente

ggplot(test_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

# Se observa un comportamiento similar con el conjunto de pruebas de compra para el a�o al conjunto de entrenamiento

ggplot(test_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

# Visualizaci�n del resultado del conjunto de entrenamiento Se instal� el acuete "ElemStatLearn"

install.packages(path_to_source, repos = NULL, type="source")
install.packages("~/Downloads/ElemStatLearn_2015.6.26.2.tar", repos=NULL, type="source")

# Se us� la biblioteca instalada. Se realiz� un diagrama que muestra las pruebas previas del conjunto de entrenamiento en forma de K-Neighbours para reducir la dimensionalidad de los datos.

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

#Ver el resultado de los datos de prueba

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