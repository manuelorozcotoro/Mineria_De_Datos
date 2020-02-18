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


#11. 

#12.

#13.

