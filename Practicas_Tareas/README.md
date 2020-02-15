**PRACTICES UNIT 1**

**INDEX**

* [1.-Test the Law Of Large Numbers for N random normally distributed numbers with mean = 0, stdev=1](#item1)
* [2.-](#item2)

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
