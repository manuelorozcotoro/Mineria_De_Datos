# Description of Evaluations

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
