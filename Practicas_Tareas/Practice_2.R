# Practice find 20 more funtions in R and make an example of it.


#1. length()
length(diag(4))

#2. abs()
require(stats) # for spline
require(graphics)
xx <- -9:9
plot(xx, sqrt(abs(xx)),  col = "red")
lines(spline(xx, sqrt(abs(xx)), n=101), col = "pink")

#3. exp()
log(exp(3))

#4. mean()
x <- c(0:10, 50)
xm <- mean(x)
c(xm, mean(x, trim = 0.10))

#5. sum()
sum(1:5)

#6. min()
min(5:1, pi)

#7. max()
max(5:1, pi)

#8. sd()
sd(1:2) ^ 2

#9. coef()
coef(dt)
x <- 1:5; coef(lm(c(1:3, 7, 6) ~ x))

#10. factorial()
require(graphics)

choose(5, 2)
for (n in 0:10) print(choose(n, k = 0:n))

factorial(100)
lfactorial(10000)


#11. ls()
var a : int =10
ls()

#12. geometric()
x<- c(0, 3, 6, 7, 9, 12)
geometric<-function(x) exp(sum(log(x))/length(x))
geometric(x)

#13. armonic
x<- c(0, 3, 6, 7, 9, 12)
armonic<-1/mean(1/x)
armonic

#14. median()
x<- c(0, 3, 6, 7, 9, 12)
median(x)

#15. variance()
x<- c(0, 3, 6, 7, 9, 12)
variance <- function (x)   sum((x-mean(x))^2)/(length(x)-1) #escrita como una funcion
variance(x)

#16. range()
x<- c(0, 3, 6, 7, 9, 12)
range(x)

#17. quantile()
x<- c(0, 3, 6, 7, 9, 12)
quantile(x)

#18. skewness()
x<- c(0, 3, 6, 7, 9, 12)
library(moments)
skewness(x)

#19. kurtosis()
library(moments)
x<- c(0, 3, 6, 7, 9, 12)
kurtosis(x)

#20. ceiling()
ceiling(4.3)
