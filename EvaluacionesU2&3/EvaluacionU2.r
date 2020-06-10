# Establecemos el entorno de trabajo
getwd()
setwd("C:\\Users\\acer\\Documents\\mineria\\DataMining-master\\Datasets")
getwd()

# Importamos el archivo de datos
movies <- read.csv("Project-Data.csv")

#Imprimimos los primeros valores de las columnas
head(movies)

# Filtramos los Géneros y Estudios específicos que se utilizarán
# Se utiló una sola línea de código en la que uzamos operadores AND"&" y OR "|" 
myfilter<- movies[((movies$Genre=="action") | (movies$Genre=="animation") | (movies$Genre=="adventure") | (movies$Genre=="comedy") | (movies$Genre=="drama")) & ((movies$Studio== "Buena Vista Studios") | (movies$Studio== "Fox") | (movies$Studio=="Paramount Pictures") | (movies$Studio=="Sony") | (movies$Studio=="Universal") | (movies$Studio=="WB")), ]

#Aestetics: Hacemos uso de la librería ggplot2 para visualizar con sus propiedades
library(ggplot2)

# Creamos el esquema gráfico con ggplot 
# En el eje x para "Genre", y para "Gross...US"
# Asignamos lo anterior al objeto "v"

v <-ggplot(myfilter, aes(x=Genre, y=Gross...US, 
                         color=Studio, size=Budget...mill.)) +
  xlab("Genre") +
  ylab("Gross % US") + ggtitle("Domestic Gross % by Genre") +
  theme(axis.title.x = element_text(color = "purple", size=12),
        axis.title.y = element_text(color = "purple", size=12))

# Le Sumamos al objeto "v" las características aestethisc usando geom_jitter y geom_boxplot
#Mostrando el resultado final 
v + geom_jitter(aes(colour = Studio)) + geom_boxplot( size=0.1,  alpha=0.7, aes(colour = Budget...mill.))

# Conclusión: 
# El género comedia es el más rentable según los resultaddos 
# ya que la caja (boxplot) se encuentra en una posición más alta
# a comparación de otros géneros
# Si en el futuro se desea usar este resultado gráfico 
# para la producción de una pelicula, la mejor opción 
# sería producir una de "Comedia"
# además de tener mejor rentabilidad ésta tiene poca competencia 
# a diferencia de las películas de "acción" o "animación"

