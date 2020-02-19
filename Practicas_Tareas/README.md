**PRACTICES UNIT 1**

**INDEX**

* [1.-Test the Law Of Large Numbers for N random normally distributed numbers with mean = 0, stdev=1](#item1)
* [2.-Practice find 20 more funtions in R and make an example of it.](#item2)
* [3.-You are a Data Scientist working for a consulting firm.](#item3)

<a name="item1"></a>

**Test the Law Of Large Numbers for N random normally distributed numbers with mean = 0, stdev=1:**

Create an R script that will count how many of these numbers fall between -1 and 1 and divide
by the total quantity of N

You know that E(X) = 68.2%
Check that Mean(Xn)->E(X) as you rerun your script while increasing N

Hint:
1. Initialize sample size
2. Initialize counter
3. loop for(i in rnorm(size))
4. Check if the iterated variable falls
5. Increase counter if the condition is true
6. return a result <- counter / N

```
# 1. Initialize sample size
N<-10
sample(-1:1)
# 2. Initialize counter

counter<-1
# 3. loop for(i in rnorm(size))

for(i in rnorm(-1:1)){
# 4. Check if the iterated variable falls
  print(i)

  # 5. Increase counter if the condition is true  
  while(TRUE)
  {
    counter<-counter+1

  }

}

# 6. return a result <- counter / N
result<- counter / N
print(result)
```

<a name="item2"></a>

**Practice find 20 more funtions in R and make an example of it.:**
```

#1. length(): Get or set the length of vectors (including lists) and factors, and of any other R object for which a method has been defined.
length(diag(4))

#2. abs(): Computes the absolute value of x, sqrt(x) computes the (principal) square root of x, √{x}.
require(stats) # for spline
require(graphics)
xx <- -9:9
plot(xx, sqrt(abs(xx)),  col = "red")
lines(spline(xx, sqrt(abs(xx)), n=101), col = "pink")


#3. exp(): By default natural logarithms, log10 computes common (i.e., base 10) logarithms, and log2 computes binary (i.e., base 2) logarithms. The general form log(x, base) computes logarithms with base base.
log(exp(3))

#4. mean(): Generic function for the (trimmed) arithmetic mean.
x <- c(0:10, 50)
xm <- mean(x)
c(xm, mean(x, trim = 0.10))

#5. sum(): Sum returns the sum of all the values present in its arguments.
sum(1:5)

#6. min(): Take one or more vectors as arguments, recycle them to common length and return a single vector giving the ‘parallel’ maxima (or minima) of the argument vectors.
min(5:1, pi)

#7. max(): Returns the (regular or parallel) maxima and minima of the input values.
max(5:1, pi)

#8. sd(): This function computes the standard deviation of the values in x. If na.rm is TRUE then missing values are removed before computation proceeds.
sd(1:2) ^ 2

#9. coef(): is a generic function which extracts model coefficients from objects returned by modeling functions. coefficients is an alias for it.
x <- 1:5; coef(lm(c(1:3, 7, 6) ~ x))

#10. factorial(): Special mathematical functions related to the beta and gamma functions.
require(graphics)

choose(5, 2)
for (n in 0:10) print(choose(n, k = 0:n))

factorial(100)
lfactorial(10000)
```
#11. ls(): We will review how many objects we have created in R. For our case we write the function list ls ()

```
var a : int =10
ls()
```

#12. geometric(): geometric mean

```
x<- c(0, 3, 6, 7, 9, 12)
geometric<-function(x) exp(sum(log(x))/length(x))
geometric(x)
```

#13. armonic: Harmonic average
```
x<- c(0, 3, 6, 7, 9, 12)
armonic<-1/mean(1/x)
armonic
```

#14. median(): Median

```
x<- c(0, 3, 6, 7, 9, 12)
median(x)
```

#15. variance(): Varianza

```
x<- c(0, 3, 6, 7, 9, 12)
variance <- function (x)   sum((x-mean(x))^2)/(length(x)-1) #escrita como una funcion
variance(x)
```

#16. range(): Shows the range, value (min) and value (max) of the variable x.

```
x<- c(0, 3, 6, 7, 9, 12)
range(x)
```

#17. quantile(): Show the quartiles of the variable x

```
x<- c(0, 3, 6, 7, 9, 12)
quantile(x)
```

#18. skewness(): Gives us the value of the asymmetry of the data of the variable x

```
x<- c(0, 3, 6, 7, 9, 12)
library(moments)
skewness(x)
```

#19. kurtosis(): Gives us the flattening of the distribution of the data of the variable x.

```
library(moments)
x<- c(0, 3, 6, 7, 9, 12)
kurtosis(x)
```

#20. ceiling(): Returns the first integer greater than x

```
ceiling(4.3)
```

<a name="item3"></a>

**You are a Data Scientist working for a consulting firm.**

#Practice 3

Scenario: You are a Data Scientist working for a consulting firm.
One of your colleagues from the Auditing Department has asked you
to help them assess the financial statement of organization X.

You have been supplied with two vector of data: mounthly revenue and
expenses for the financial year in quiestion. Your task is to calculate
the following financial matrics:

  - profit for each mounth
- profit after tax for each month (the tax rate is 30%)
- profit margin for each month - equal to profit after tax divided by revenue
- good months - where the profit after tax was greater than the mean for the year
- bad months - where the profit after tax was less then the mean for years
- the best month - where the profit after tax was max for the year
- the worst month - where the profit after tax was min for the year

All results need to be presented as vectors.

Results for dollar values need to be calculate with $0.01 precision, but need to be
presented in Units of $1,000(i.e. 1k) with no decimal point.

Results for the profit margin ratio needed to be presented in units of % with no
decimal points.

Note: Your collegue has warned you that it is okay for tax for any given month to be
negative (in accounting terms, negative tax translates into a deferred tax asset).

Hint 1
Use:
  round()
mean()
max()
min()
```
#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
# 1 Calculate Profit As The Differences Between Revenue And Expenses
profit <- revenue - expenses
profit

# 2 Calculate Tax As 30% Of Profit And Round To 2 Decimal Points
tax <- round(0.30 * profit, 2)
tax

# 3 Calculate Profit Remaining After Tax Is Deducted
profit.after.tax <- profit - tax
profit.after.tax

# 4 Calculate The Profit Margin As Profit After Tax Over Revenue
#Round To 2 Decimal Points, Then Multiply By 100 To Get %
profit.margin <- _(_ / _, 2) * _
profit.margin

# 5 Calculate The Mean Profit After Tax For The 12 Months
mean_pat <- _(profit.after.tax)
mean_pat

# 6 Find The Months With Above-Mean Profit After Tax
good.months <- _ _ mean_pat
good.months

# 7 Bad Months Are The Opposite Of Good Months !
bad.months <- !good.months
bad.months

# 8 The Best Month Is Where Profit After Tax Was Equal To The Maximum
best.month <- profit.after.tax == max(profit.after.tax)
best.month

# 9 The Worst Month Is Where Profit After Tax Was Equal To The Minimum
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month

# 10 Convert All Calculations To Units Of One Thousand Dollars
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- _(_ _ _, _)
profit.1000 <- _(_ _ _, _)
profit.after.tax.1000 <- _(_ _ _, _)

#Print Results
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month

#BONUS:
#Preview Of What's Coming In The Next Section
M <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.after.tax.1000,
  profit.margin,
  good.months,
  bad.months,
  best.month,
  worst.month
)

#Print The Matrix
M
```
