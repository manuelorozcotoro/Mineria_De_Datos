
getwd()
setwd("/users/Dell/Desktop/DataMining-master/MachineLearning/MultipleLinearRegression/")
getwd()

# Importando el conjunto de datos

dataset <- read.csv('50_Startups.csv')

# Codificación de datos categóricos

dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))

dataset

# División del conjunto de datos en el conjunto de entrenamiento y el conjunto de prueba Install.packages ('caTools')

library(caTools)

set.seed(123)

split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Atomation BackwardElimination Function

backwardElimination <- function(x, sl) {
  numVars = length(x)
  for (i in c(1:numVars)){
   
# Ajuste de la regresión lineal múltiple al conjunto de entrenamiento regresor = lm (fórmula = Beneficio ~ RDSpend + Administración + Marketing. Gasto + Estado)
    
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

# Vemos que existe la linealidad y la homocedacidad está presente (cuando la varianza del error condicional a las variables explicativas es constante a lo largo de las observaciones).

library(car)
vif(regressor) # VIF for each var<4, no multicollinearity , Thus we conclude that assumptions hold true

# Primera iteración de eliminación hacia atrás (eliminar estado)

regressor = lm(formula = Profit ~ `R.D.Spend` + Administration + `Marketing.Spend`,
               data = training_set)
summary(regressor)

# Segunda iteración (Eliminar administración)

regressor = lm(formula = Profit ~ `R.D.Spend` + `Marketing.Spend`,
               data = training_set)

summary(regressor)

# Tercera iteración (Eliminar gasto de marketing)

regressor <- lm(formula = Profit ~ `R.D.Spend`,
                data = training_set)
# resumen (regresor)

We will consider Marketing spend in the model since it is very close to the significance level of 0.05 as well including it increases the R- Sqaured
Final

#regresor = lm (fórmula = Profit ~ R.D.Spend+ Marketing.Spend, data = training_set) resumen (regresor)


y_pred = predict(regressor, newdata = test_set)
y_pred
test_set$Profit
plot(y_pred, test_set$Profit)