# Zach Girard
# Lab06- Week 7
# Defining functions


# Problem 1
# define a function that calculatesthe area of a triangle
# then call the function to test


# Function is named and defined. Takes base and height as arguments.
triangleArea <- function(base,height){
  area <- 0.5 * base * height   # calculation
  return(area)  # return allows ouput and ability to save in variable
}

# test calls 
triangleArea(10,9) 
triangleArea(2,3)


# Problem 2
# create a function that can calculate the absolute value
# function should work on vectors too

# function is named and defined. Takes x which can be a single numeric value or a vector of numeric values
myAbs <- function(x){
  absValue <- rep(NA, length(x))  # creates vector for storage of return values
  for(i in 1:length(x)){
    if(x[i] >= 0){   # evaluates if x value(s) is positive or zero
      absValue[i] <- x[i]  
    }
    else{     # evaluates all negative numbers
      absValue[i] <- x[i] * -1
    }
  }
  return(absValue)  # returns the vector of absolute value(s)
}
  
# test calls
myAbs(5) 
myAbs(-2.3)
myAbs(c(1.1, 2, 0, -4.3, 9, -12))


# Problem 3
# create a function that returns a vector of the first n Fibonacci numbers. 
# Bonus 3a: make function work for n = 1 and n = 2 
# Bonus 3b: make an error warning for zero, non-numeric, and negative numbers



Fibonacci <- function(n, startingNum){
  if(is.numeric(n) == FALSE | n <= 0 ){  # prints warning message for zero, negative, and non-numeric values 
    print("Warning: n must be a numeric value greather than 0")
  }
  if(startingNum != 1 | startingNum != 2){ # prints warning if starting umber is not 1 or 2
    print("Warning: starting number must be 1 or 2")
  }
  if(n == 1){ # special conditional for n = 1
    return(startingNum)
  }
  if(n == 2){ # special conditional for n = 2
    return(c(startingNum,1))
  }
    
  Fib_nums <- rep(1, n) # creates vector of 1s to stor sequence of length = n
  if(startingNum == 0){ # changes index 1 to 0 if starting number is chosen as 0
    Fib_nums[1] <- 0
  }
  for(i in 3:length(Fib_nums)){ # performs Fibonacci sequence calculation from Lab 4
    Fib_nums[i] <- Fib_nums[i - 1] + Fib_nums[i - 2]
  }
  return(Fib_nums) # returns vector of Fibonacci sequence with length = n
}


# test calls
Fibonacci(5,1)
Fibonacci(5,0)
Fibonacci(2,0)
Fibonacci(1,1)
Fibonacci(0,0)
Fibonacci(-2,1)



# Problem 4a
# Write a function that takes two numbers as its arguments and returns the square of the difference between them. In other words, for any two numbers x and y your function should calculate and return the quantity (x - y) ^ 2.

sq_diff <- function(x,y){
  sq_d <- rep(NA, length(x)) # creates vector of length = n that stores squared difference value(s)
  for(i in 1:length(x)){
    sq_d[i] <- (x[i] - y) ^ 2  # performs calculation
  }
  return(sq_d) # returns vector
}


# test calls
sq_diff(3,5)
sq_diff(c(2,4,6), 4)


# Problem 4b
# create a function that calculates the average of a vector of numbers

average <- function(x){
  avg <- sum(x) / length(x)
  return(avg)
}


# test calls
average(c(5, 15, 10))

data <- read.table()



















