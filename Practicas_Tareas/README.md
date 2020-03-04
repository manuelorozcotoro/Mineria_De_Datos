**PRACTICES UNIT 1**

**INDEX**

* [1.-Test the Law Of Large Numbers for N random normally distributed numbers with mean = 0, stdev=1](#item1)
* [2.-Practice find 20 more funtions in R and make an example of it.](#item2)
* [3.-You are a Data Scientist working for a consulting firm.](#item3)
* [4.-Practice Fillin the Blanks.](#item4)
* [5.-Practice 5, Filter Countries.](#item5)

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



<a name="item4"></a>

**Practice Fillin the Blanks:**

Instructions for this dataset:
*You have only been supplied vectors. You will need to create the matrices yourself*
Matrices:
- FreeThrows
- FreeThrowAttempts

*Reference by Kirill Eremenko www.superdatascience.com*

```
#Notes and Corrections to the data:
#Kevin Durant: 2006 - College Data Used
#Kevin Durant: 2005 - Proxied With 2006 Data
#Derrick Rose: 2012 - Did Not Play
#Derrick Rose: 2007 - College Data Used
#Derrick Rose: 2006 - Proxied With 2007 Data
#Derrick Rose: 2005 - Proxied With 2007 Data

#Seasons
Seasons <- c("2005","2006","2007","2008","2009","2010","2011","2012","2013","2014")

#Players
Players <- c("KobeBryant","JoeJohnson","LeBronJames","CarmeloAnthony","DwightHoward","ChrisBosh","ChrisPaul","KevinDurant","DerrickRose","DwayneWade")

#Free Throws
KobeBryant_FT <- c(696,667,623,483,439,483,381,525,18,196)
JoeJohnson_FT <- c(261,235,316,299,220,195,158,132,159,141)
LeBronJames_FT <- c(601,489,549,594,593,503,387,403,439,375)
CarmeloAnthony_FT <- c(573,459,464,371,508,507,295,425,459,189)
DwightHoward_FT <- c(356,390,529,504,483,546,281,355,349,143)
ChrisBosh_FT <- c(474,463,472,504,470,384,229,241,223,179)
ChrisPaul_FT <- c(394,292,332,455,161,337,260,286,295,289)
KevinDurant_FT <- c(209,209,391,452,756,594,431,679,703,146)
DerrickRose_FT <- c(146,146,146,197,259,476,194,0,27,152)
DwayneWade_FT <- c(629,432,354,590,534,494,235,308,189,284)

#Matrix for Free Throws
#Bind the given vectors to form the matrix
FreeThrows <- _(KobeBryant_FT, JoeJohnson_FT, LeBronJames_FT, CarmeloAnthony_FT, DwightHoward_FT, ChrisBosh_FT, ChrisPaul_FT, KevinDurant_FT, DerrickRose_FT, DwayneWade_FT)
#Remove vectors - we don't need them anymore
_(KobeBryant_FT, JoeJohnson_FT, CarmeloAnthony_FT, DwightHoward_FT, ChrisBosh_FT, LeBronJames_FT, ChrisPaul_FT, DerrickRose_FT, DwayneWade_FT, KevinDurant_FT)
#Rename the columns
_(FreeThrows) <- _
#Rename the rows
_(FreeThrows) <- _

#Check the matrix
FreeThrows

#Free Throw Attempts
KobeBryant_FTA <- c(819,768,742,564,541,583,451,626,21,241)
JoeJohnson_FTA <- c(330,314,379,362,269,243,186,161,195,176)
LeBronJames_FTA <- c(814,701,771,762,773,663,502,535,585,528)
CarmeloAnthony_FTA <- c(709,568,590,468,612,605,367,512,541,237)
DwightHoward_FTA <- c(598,666,897,849,816,916,572,721,638,271)
ChrisBosh_FTA <- c(581,590,559,617,590,471,279,302,272,232)
ChrisPaul_FTA <- c(465,357,390,524,190,384,302,323,345,321)
KevinDurant_FTA <- c(256,256,448,524,840,675,501,750,805,171)
DerrickRose_FTA <- c(205,205,205,250,338,555,239,0,32,187)
DwayneWade_FTA <- c(803,535,467,771,702,652,297,425,258,370)

#Matrix for Free Throw Attempts
#Bind the given vectors to form the matrix
FreeThrowAttempts <- rbind(KobeBryant_FTA, JoeJohnson_FTA, LeBronJames_FTA, CarmeloAnthony_FTA, DwightHoward_FTA, ChrisBosh_FTA, ChrisPaul_FTA, KevinDurant_FTA, DerrickRose_FTA, DwayneWade_FTA)
#Remove vectors - we don't need them anymore
rm(KobeBryant_FTA, JoeJohnson_FTA, CarmeloAnthony_FTA, DwightHoward_FTA, ChrisBosh_FTA, LeBronJames_FTA, ChrisPaul_FTA, DerrickRose_FTA, DwayneWade_FTA, KevinDurant_FTA)
#Rename the columns
colnames(FreeThrowAttempts) <- Seasons
#Rename the rows
rownames(FreeThrowAttempts) <- Players

#Check the matrix
FreeThrowAttempts

#Re-create the plotting function
myplot <- function(z, who=1:10) {
  matplot(t(z[who,,drop=F]), type="b", pch=15:18, col=c(1:4,6), main="Basketball Players Analysis")
  legend("bottomleft", inset=0.01, legend=Players[who], col=c(1:4,6), pch=15:18, horiz=F)
}


#Visualize the new matrices
myplot(FreeThrows)
myplot(FreeThrowAttempts)

#Part 1 - Free Throw Attempts Per Game 
#(You will need the Games matrix)
myplot(FreeThrowAttempts/Games)
#Notice how Chris Paul gets few attempts per game

#Part 2 - Free Throw Accuracy
myplot(FreeThrows/ FreeThrowAttempts)
#And yet Chris Paul's accuracy is one of the highest
#Chances are his team would get more points if he had more FTA's
#Also notice that Dwight Howard's FT Accuracy is extremely poor
#compared to other players. If you recall, Dwight Howard's
#Field Goal Accuracy was exceptional:
myplot(FieldGoals/FieldGoalAttempts)
#How could this be? Why is there such a drastic difference?
#We will see just now...

#Part 3 - Player Style Patterns Excluding Free Throws
myplot((Points-FieldGoals)/FreeThrows)
```

Because we have excluded free throws, this plot now shows us the true representation of player style change. We can verify that this is the case because all the marks without exception on this plot are between 2 and 3. That is because Field Goals can only be for either 2 points or 3 points.

Insights:
1. You can see how players' preference for 2 or 3 point shots changes throughout their career. We can see that almost all players in this dataset experiment with their style throughout their careers. Perhaps, the most drastic change in style has been experienced by Joe Johnson.

2. There is one exception. You can see that one player has not changed his style at all - almost always scoring only 2-pointers.
Who is this mystert player? It's Dwight Howard! 
Now that explains a lot. The reason that Dwight Howard's
Field Goal accuracy is so good is because he almost always scores 2-pointers only. That means he can be close to the basket or even in contact with it. Free throws, on the other hand require the player to stand 15ft (4.57m) away from the hoop. That's  probably why Dwight Howard's Free Throw Accuracy is poor.


<a name="item5"></a>

**Practice 5, Filter Countries:**
The syntax of the proposed examples is used

1. Filter countries by Low income
*The column was filtered with the records Low income*
```
stats[stats$Income.Group=="Low income",]
```
2. Filter countries by Lower middle income
*The column was filtered with the records Low middle income*
```
stats[stats$Income.Group=="Lower middle income",]
```
3.Filter countries by Upper middle income
*The column was filtered with the records Upper middle income*
```
stats[stats$Income.Group=="Upper middle income",]
```
4. Filter by countrie Malta
*The column was filtered with the record Malta in Country.Name column*
```
stats[stats$Country.Name=="Malta",]
```
5. Filter by countrie Qatar


6. Filter by countrie Netherlands


7. Filter by countrie Norway

