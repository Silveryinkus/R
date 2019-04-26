###Section 4: Matrices ###


###************
## Project Brief: Basketball Trends ##

#Goal: Analyze the trends in the top 10 NBA // Basketball
#goal of this section: Martices
#NBA = National Basketball League

#Analyze the highest paid players 2015/2016
#Ananlyze their performance (trends and patterns)

#GP - Games played
#MPG - minutes per game
#FG - field goals (no penalty)
#PPG - points per game

#consider investigating the salary
Salary

###************
## Matrices ##

# A table has column and a row

#indexation issue: you need to specify if it is a row or column
#to index, put 2 number in the brackets
#A[3,4] = A[3,4] 3rd row, 4th column
#A[1,] = all items in the 1st row
#A[, 2] =  all items in the 2nd column

#In a matrix, elements must all be of the same data type

###************
## Building matrix ##

Salary
Games
MinutesPlayed

#rm() removes objects from your workspace
#to build a matrix function, use #matrix()
#2nd option: 
#use rbind() - binds rows into a matrix
#use cbind() - binds column into a matrix
#the vectors must be of the same length

?matrix
my.data <- 1:20
my.data

A <- matrix(my.data, 4, 5)
A
#how do we get to '10'
A[2,3]

#Create another matrix

B <- matrix(my.data, 4, 5, byrow=T)
B
#how do we get to '10'
B[2,5]

#rbind() combines R objects by rows or columns
?rbind()

r1 <- c("I", "am", "happy")
r2 <- c("What", "a", "day")
r3 <- c(1, 2,3)

c <-rbind(r1, r2, r3)
c

#cbind()
c1 <- 1:5
c2 <- -1:5
D <- cbind(c1,c2)
D
#there is a warning message
#Warning message:
#In cbind(c1, c2) :
#number of rows of result is not a multiple of vector length (arg 1)



###************
## Naming dimensions ##
#when calling out the name, you use quotation marks

#A[3, "S"]
#calling out the row and column by their name

#named vectors
#v["d"]
#when calling names of rows or column that are characters, 
#use quotation marks


###************
## rownames()  columnnames() ##

#Named Vectors
Charlie <- 1:5
Charlie

# how to give names
names(Charlie) #there are no names in this vector

names(Charlie) <- c("a", "b", "c", "d", "e")
Charlie #now we have a named vector
names(Charlie) #the notion: everything is a vector

#how to clear names
names(Charlie) <- NULL
Charlie

#Naming matrix Dimensions 1
temp.vec <- rep(c("a", "B", "zZ"), 3)
temp.vec <- rep(c("a", "B", "zZ"), times = 3)
temp.vec <- rep(c("a", "B", "zZ"), each = 3)
temp.vec

#create a matrix out of the vector
Bravo <-matrix(temp.vec, 3, 3)
Bravo

#lets name the elements of the matrix
rownames(Bravo) <- c("How", "are", "you?")
Bravo

colnames(Bravo) <- c("X", "Y", "Z")
Bravo

#remove row/column names
Bravo["are", "Y"] <- 0

rownames(Bravo) <- NULL
Bravo


###************
## Matrix Operations ##
Games
rownames(Games)
colnames(Games)
Games["LeBronJames", "2012"]

FieldGoals

#In R, you can divide a matrix by another

FieldGoals/Games

round(FieldGoals/Games, 1)

#minutes played per game played
round(MinutesPlayed/Games)

#you can perform vector operations with matrices


###************
## Visualize with Matplot() ##

#matplot function: plot columns of matrices

?matplot #go over all the different paramenters
#check the table to ensure that this is what you want to plot
#the function will plot each column if not specified
#hence we need to transose the  table
FieldGoals

#transpose t
t(FieldGoals)

#add a legend
matplot(t (FieldGoals), type = "b", pch = 15:18, col =c( 1:4,6))
legend("bottomleft", inset = 0.01, legend =Players, col = c(1:4,6), pch = 15:18, horiz = F)

#daaset does not take into account injuries
FieldGoals
t(FieldGoals/Games)

#let's check accuracy
matplot(t (FieldGoals/FieldGoalAttempts), type = "b", pch = 15:18, col =c( 1:4,6))
legend("bottomleft", inset = 0.01, legend =Players, col = c(1:4,6), pch = 15:18, horiz = F)


###************
## Subsetting ##

#a lot of R users get it wrong....

x<- c("a", "b", "c", "d", "e")
x
x[c(1,5)]
x[1]

#consider looking at the top 3 paid players 
#and their stats for the past 5 years
Games

Games[1:3,6:10]

#compare the top and lowest paid players

Games
Games[1:3, 6:10]
Games[, c("2008", "2009")]

#so everytime we subset  matrix, we get a matrix
#this is not always true

Games[1,]
Games[1,5]
#matrix has row name and the other does not
#the result is actually a vector

is.matrix(Games[1,])
is.vector(Games[1,])
Games[1,5]

#here, R is guessing that when you are getting a 1D matrix, you want a vector
#use drop function to drop 1D dimension

Games[1,,drop=F]
Games[1,5,drop=F]

#when using square bracket, R will try to guess what you want
#to prevent it from returning a vector, use the drop function, drop=F


###************
## Visualizing Subsets ##

#here we are using subsetting to visualize our data
Data <- MinutesPlayed[1:3,]
matplot(t (Data), type = "b", pch = 15:18, col =c( 1:4,6))
legend("bottomleft", inset = 0.01, legend =Players[1:3], col = c(1:4,6), pch = 15:18, horiz = F)

#how subsetting works with 1D matrix 
#matplot requires 2D matrix
Data <- MinutesPlayed[1,]
matplot(t (Data), type = "b", pch = 15:18, col =c( 1:4,6)) #not the desired results
legend("bottomleft", inset = 0.01, legend =Players[1], col = c(1:4,6), pch = 15:18, horiz = F)

#now use drop function
Data <- MinutesPlayed[1,, drop =F]
matplot(t (Data), type = "b", pch = 15:18, col =c( 1:4,6)) #not the desired results
legend("bottomleft", inset = 0.01, legend =Players[1], col = c(1:4,6), pch = 15:18, horiz = F)



###************
## Creating a Function ##

#functions are designed to encapsulate a set of operations
#encapsulate the above mat plot into a function using function(){}

myplot <- function(){
  Data <- MinutesPlayed[1,, drop =F]
  matplot(t (Data), type = "b", pch = 15:18, col =c( 1:4,6)) #not the desired results
  legend("bottomleft", inset = 0.01, legend =Players[1], col = c(1:4,6), pch = 15:18, horiz = F)
}

myplot()

#use parameters to change some key things in the function
#here have a variable to call so as change variables
#this is how we make functions flexible
myplot <- function(rows){
  Data <- MinutesPlayed[rows,, drop =F]
  matplot(t (Data), type = "b", pch = 15:18, col =c( 1:4,6)) #not the desired results
  legend("bottomleft", inset = 0.01, legend =Players[rows], col = c(1:4,6), pch = 15:18, horiz = F)
}

myplot(1:9)
#consider setting the default value:

###************
## Basketball Insights ##

myplot <- function(data, rows=1:10){
  Data <- data[rows,, drop =F]
  matplot(t (Data), type = "b", pch = 15:18, col =c( 1:4,6))
  legend("bottomleft", inset = 0.01, legend =Players[rows], col = c(1:4,6), pch = 15:18, horiz = F)
}

myplot(Games)

#the focus is on analytics and data science

#Salary
myplot(Salary)
myplot(Salary/Games) -#2 players injured here
myplot(Salary/FieldGoals)
#salary is not affected by injury, but game statistics does

#In-Game Metrics
myplot(FieldGoals/Games)
myplot(FieldGoals/FieldGoalAttempts)
myplot(FieldGoalAttempts/Games)
myplot(Points/Games)

#injuries affect in-game statistics
#hence consider normalizing injuries

#Interesting Observations
myplot(MinutesPlayed/Games)
myplot(Games)

#Time is Vauable
myplot(FieldGoals/MinutesPlayed)

#Player Style
myplot(Points/FieldGoals)

###************
## Homework: Basketball Free Throws ##

