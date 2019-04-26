###Section 3: Fundamentals of R ###


###************
## What is a vector? ##

#a vector is a sequence of data element. Think of books in bookshelf
#numeric vector (anything with numbers)
#vector: from linear algebra; have a beginning and end
#character vector: with character elements (Z, f, 7)
#a vector can only have element of same type, R will automatically make the change
#a single number is stored as a vector of length 1
#everything in R is always stored as a vector by default

## Create a vector? ##
MyFirstVector <- 3, 45, 56, 732

#Combine
#we need to combine them into a vector using a 'function' called // c = combine
MyFirstVector <- c(3, 45, 56, 732)
MyFirstVector

#check if object is numeric/integer
is.numeric(MyFirstVector)
is.integer(MyFirstVector)

#note: R defaultly stores numbers/integers as double
is.double(MyFirstVector)

#to store integer as integer, add the letter L
V2 <-c(3L, 12L, 243L, 0L)
is.numeric(V2)
is.integer(V2)
is.double(V2)

V3 <- c("a", "b", "Hello")
V3
is.character(V3)
is.numeric(V3)

#now test if a vector can only have element of same type, no mixing of type
# you can convert a number to a character but not vice versa

V3a <- c("a", "B23", "Hello", 7)
V3a
is.character(V3a)
is.numeric(V3a)

#here, R has converted the 7 to a character

#Sequence
seq() #sequence - like ':'
rep() #replicate

seq(1,15) # do not use : here
1:15

#sequence can give you more option/flexibility to add more parameters
seq(1,15,2) #generate every other number

z <- seq(1, 15, 4) #generate every 4th number
z

#replicate
rep(3, 50) # replicate 3, 50times
d <-rep(3, 50)

#you can also replicate a character
rep("a", 5)

x <- c(80, 20)
y <- rep (x, 10)
y

###************
## Using Brackets [] ##to idenify the index/location of a unit in a vector
x <- c( 1,123, 534, 13, 4)#combine
y <- seq(201, 250, 11) #sequence
z <- rep( "Hi", 3) #replicate


w <- c("a", "b", "c", "d", "e")
w

w[1] # the 1st letter
w[2] # the 2nd letter
w[3] # the 3rd letter

v <- w[-3] # all elements but the 3rd
w[1:3] #the first 3 element
w[3:5] #the 3rd to 5th element
w[c(1,3,5)] #the 3rd to 5th element
w[c(-2,-4)] #all element but the 2nd and 4th
#there are different ways to get same results in R

#you won't need to access individual elements in R often. 
#No need for square bracket as R is a vector driven language

#note: be very exploratory and experiment with R
#you need to keep practicing and testing the limits of R and ask question

#lygometery: quantifying/measuring what you don't know


###************
## Vectorized operations ##

#consider summations of elements from 2 vectors
#no need to create loops for arithmetic operations as everything happens in vector
#operations are completed element by element

#consider adding a smaller vector to a larger vector
#R will recycle the vectors

x <- c( 1,123, 534, 13, 4)
y <- c( 1,123, 534, 13, 5)
z <- c( 1,123,  13, 4)

a <- (x + y)
b <- (x - y)
c <- (x/y)
d <- (z + y) # it adds the elements but gives you a warning message
#In z + y : longer object length is not a multiple of shorter object length
e <- (y -z)
f <- (y/z)



###************
## Power of vectorized operations ##

#why vectorized operations is much preferred than devectorized in R

x <- rnorm(5)
x

#R specific programming loop
for (i in x){
  print (i)
}
#here i is iterating over each element
#to print specific value:
print(x[1]) #prints the 1st value
print(x[2]) #prints the 2nd value

#when you are doing a iterative process, use a loop
print(x[j]) # now lets turn this into a loop #iterate over numbers

#conventional programming loop
for (j in 1:5){
  print(x[j])
}

# - - - - - - --  2nd Part
#Compare vectorized vs devectorized operations

N <- 10000000
a <- rnorm(N)
b <- rnorm(N)

## Vectorized approach ##
c <- a * b
c
#this approach is faster

## Devectorized approach ##
d <- rep(NA, N) #replicate an empty vector to allocate memory
for (i in 1:N) {
  d[i]<- a[i]*b[i]
}

d
#this takes longer

#note a devectorized operations works better in C or Julia programming language
#R is a high level programming languages
#R is acting as a wrapper for C and Fortran language
#R is communicating with C and Fortran to perform the operations




###************
## Functions in R ##

#How fuctions work?
#It requires an input variables
#function processes the input variables and produces an output
# sort of like a blender produces a 'smoothie' output from 'fruits' inputs

#some functions that have been used

#rnorm()
#c()
#seq()
#rep()

#print()
# is.numeric()
# is.integer()
# is.double()
# is.character()

# typeof()
# sqrt()
# paste()

# to comment  a line *SHIFT + CMND + C*
#? - to bring out the help, type ? infront of the function

?rnorm()
#rnorm(n, mean = 0, sd = 1) this are default values
rnorm( 5, 10, 8)
# the above function is asking to generate 5 numbers with mean = 2 and sd =8
# you can also write it as
rnorm(n=5, mean = 10, sd = 8)
rnorm(n=5, sd = 8)
rnorm(n=5, mean = 8)

?c()

?seq()
seq(from = 10, to = 20, by =3)
seq(from = 10, to = 20, length.out = 100) #produces 100 numbers (length of output) 
#b/t 10 and 20

?rep()
# rep(x, ...)
# rep.int(x, times)
# rep_len(x, length.out)

rep(5:6, times =10) # 5 6 5 6 5 6 5 6 5 6 5 6 5 6 5 6 5 6 5 6
rep(5:6, each =10) # 5 5 5 5 5 5 5 5 5 5 6 6 6 6 6 6 6 6 6 6

?sqrt()
A <- seq(from = 10, to = 20, along.with = x)
A
B <- sqrt(A)
B

?paste()




###************
## Packages in R ##
# Packages are collections of R functions
#librarries is where packages are stored
#you can check/uncheck the package to activate/deactivate

# packages are installed from CRAN
# CRAN - Comprehensive R Archive Network

#Install GGplot2
install.package("ggplot2")
# we don't have access to some functions until we activate the package
?qplot()
?ggplot()
?diamonds()
#to activate a package: librabry is a fcn to activate packages
library(ggplot2)
?qplot()
?ggplot()
?diamonds()

qplot( data=diamonds, carat, price, 
       colour=clarity, facets = .~clarity)




###************
## Homework ##

#Finanacial Statement Analysis

#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
#Calculate Profit As The Differences Between Revenue And Expenses
#profit for each month
profit <- revenue - expenses
profit

#Calculate Tax As 30% Of Profit And Round To 2 Decimal Points
#profit after tax for each month (tax rate = 30%)
tax <- round(profit*0.30, digits = 2)
tax 

#Calculate Profit Remaining After Tax Is Deducted
profit.after.tax <- profit - tax
profit.after.tax

#Calculate The Profit Margin As Profit After Tax Over Revenue
#Round To 2 Decimal Points, Then Multiply By 100 To Get %
profit.margin <- round(profit.after.tax/ revenue, 2)*100
profit.margin

#Calculate The Mean Profit After Tax For The 12 Months
mean_pat <- round(profit.after.tax)
mean_pat

#Find The Months With Above-Mean Profit After Tax
#good months - profit after tax (pat) > mean pat
#good month = pat > mean pat
good.months <- profit.after.tax > mean_pat
good.months

#Bad Months Are The Opposite Of Good Months !
#bad month = pat < mean pat
#business seems to perform better during holiday season
bad.months <- !good.months
bad.months

#The Best Month Is Where Profit After Tax Was Equal To The Maximum
#best month = pat > mean pat
best.month <- profit.after.tax == max(profit.after.tax)
best.month
#best month is December
rep(8140.68, 12)

#The Worst Month Is Where Profit After Tax Was Equal To The Minimum
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month
#the worst month was March

#Convert All Calculations To Units Of One Thousand Dollars
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses / 1000, 0)
profit.1000 <- round(profit / 1000, 0)
profit.after.tax.1000 <- round(profit.after.tax / 1000, 0)

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
#you can presend this to your client or audience
