## R Programming A-Z™: R For Data Science
## Section 2: Core Programming Principles
## ---
## Type of Variables ##

###************
## Integers
#to run your code  (on keyboard: CMND + ENTER)
#assign 2 to x // to store as an integer, add 'L'
x <- 2L
#to check the variable type:
typeof(x)

#double
y <- 2.5
typeof(x)

## R by default stores integer as double

#complex numbers
z<- 3+2i
typeof(z)

#character: to put a letter in a variable, you use quotation marks ""
a <- "h"
typeof(a)

#logical variables (True/False)
q1 <- T
typeof(q1)
q2 <- FALSE
typeof(q2)
q3 <- TRUE
typeof(q3)

###************
## Using Variables ##
#always save your files that was created

A <- 10
B <- 5
C <- A + B
#note: spaces in R does not matter, 
#but it is best to input them for readability purpose
#you can also execute multiple lines, just highlight the code
C

#variable 1
var1 <- 2.5
#variable 2
var2 <- 4
result <- var1/var2
result

#you can call functions and pass values into them
answer <- sqrt(var2)
answer

#character operations
greeting <- "hello"
name <- "Bob"
#to add 2 variable together, use 'paste'
message <- paste(greeting, name)
message

#note: the best way to learn a new programming language is to practice

###************
##Logical Variables and Operators ##
# T - TRUE | F - FALSE

4 < 5 #True
10 > 100 #

# == Equal to
# != Not equal to
# < less than
# > greater than
# <= less than or equal to
# >= greater than or equal to
# ! not
# / or
# & and
# isTRUE() is this true?

result2 <- 4 < 5
result2
typeof(result2)

result3 <-!(5 > 1)
result3

result2 | result3 #result2 OR result3 is true?
result2 & result3 #result2 AND result3 is true?

isTRUE(result2) #is this true?

##*************
## The "While" Loop ##
#while the condition in () is true, it executes  the condition in the {} bracket
#until the condition is no longer met and the loop stops

while (FALSE) {
  print("Hello")
}

#the + means that the loop continues

while (TRUE) {
  print("Hello")
}

#here you get an infinite loop that prints "hello" as it continues to run
#to stop the run, press "Esc"

counter <- 1
while(counter < 12){
  print (counter)
  counter <- counter + 1
}


##*************
## Using the console ##

x <- 5
x 
#R studio is an IDE environment (Shell) to make working in R much more friendly
#you can also use R directly by writing the code directly in the console

#note:you may not be able to save if you type directly in the console



##*************
## The "For" Loop ##
#similar to the while loop, but easier

counter <- 1
while(counter < 12){
  print (counter)
  counter <- counter + 1
}

for(i in 1:5){
  print("Hello R")
}

#for loop is shorter than while loop
#this is the first encounter with vectors 1:5. It iterates thru i
1:5 # this is a vector/sequence/array of numbers

##*************
## The "IF" Statement ##
# we want to generate random normalized numbers between these values
# ----- -2 ----- -1 ----- 0 ---- 1 ---- 1 ---- 2
#to generate random number, use rnorm()

#if you keep running this equation, you will get a different number from each run
#use the "if" statement to see where the number will fall
#if statment only run once

x <- rnorm(1)
if (x > 1){
  answer <- "Greater than 1"
}

#how to remove variable in R use rm()
rm(answer)
x <- rnorm(1)
if (x > 1){
  answer <- "Greater than 1"
}

#if we want something else to happen, use 'else' statement
rm(answer)
x <- rnorm(1)
if (x > 1){
  answer <- "Greater than 1"
} else{
  answer <- "Less or equal to 1"
}

#what if we have another condition to add?
#simply run an additional if ..else statement
#nested if... else statement

rm(answer)
x <- rnorm(1)
if (x > 1){
  answer <- "Greater than 1"
} else{
  
  if (x >= 1){
    answer <- "Between -1 and 1"
  } else{
  answer <- "Less than -1"
}
}
#nested statement gets to messy, use chaining method instead

rm(answer)
x <- rnorm(1)
if (x > 1){
  answer <- "Greater than 1"
} else if (x >= 1){
  answer <- "Between -1 and 1"
  } else{
    answer <- "Less than -1"
  }


##*************
## Homework: Law of large numbers ##

#ex: coin toss
# set up 100 normally distributed variables

N <- 10000 #input
counter <- 0
rnorm(100)

#now set up your for loop
for(i in rnorm(N)){
  if ( i >-1 & i < 1){
    counter <-counter + 1
  }
}
counter

perccounter <- counter/100 #percentage counter

# this counter is telling us how many numbers fall between -1 and 1
#compare percentage of numbers to 68.2%
