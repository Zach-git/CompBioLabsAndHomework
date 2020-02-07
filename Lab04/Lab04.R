# Lab 4

# Part 1: Practice writing "for loops"

# Part 1 step 1: write a for loop that prints hi to the console 10 times

for(i in 1:10){
  print("hi") }

# Part 1 step 2: write a for loop that prints Tim's total amount of money each week for 8 weeks

Tims_total <- rep(NA,9) # If this is week 1, then by counting for 8 more weeks we will have 9 weeks total
Tims_total[1] <- 10    # Tim starts out with $10 in his bank
Weekly_allowance <- 5  # Tims Parents give him $5 every week
Weekly_Gum_price <- 1.34 * 2  #Tim buys 2 packs of gum every week

# The loop starts in the second index so that in the end we have 8 weeks of accumulation plus the starting value of $10 in the vector
# Note that we do not print the entire vector, only the 8 weeks we loop over
for(i in 2:length(Tims_total)){
  Tims_total[i] <- Tims_total[i - 1] + Weekly_allowance
  Tims_total[i] <- Tims_total[i] - Weekly_Gum_price
  print(Tims_total[i])
}

# Part 1 step 3: write a for loop that prints a populations size over 7 years

Population_size <- rep(NA,8) # creates a vector for this year plus next 7
Population_size[1] <- 2000  # Current pop size is 2000
Growth_rate <- 0.95 # The population size is predicted to shrink by 5% each year


# We loop over the last 7 indexs and multiply the previous index value by the growth rate
for(i in 2:length(Population_size)){
  Population_size[i] <- Population_size[i - 1] * Growth_rate
  print(Population_size[i])
}


# Part 1 step 4: write a for loop that uses the discrete-time logistic growth equation to calculate the abundance up to n[12], when n[1]= 2500 , r=0.8 and K=10000

n <- seq(1,12,1)  # we want to calculate n up to n=12
n[1] <- 2500 # starting abundance
K <- 10000 # carrying capacity
r <- 0.8  # instinsic growth rate of population

length(n)
for(t in 2:length(n)){
  n[t] = n[t-1] + ( r * n[t-1] * (K - n[t-1])/K )
  print(n[t])
}

print(n[12])  # the predicted value of n[12] is 9999.985


# Part 2: Practice writing for loops and storing the data produced

#Part 2 step 5: practice basic array indexing in loops
# 5a: use rep to make vector of 18 0s
Eighteen_0s <- rep(0,18)  # makes vector of 18 zeros
print(Eighteen_0s)

# 5b: Replace the code that will make the loop store 3 times the ith value of the iterator variable (i) in the ith spot of the vector you created in part a.

# loops over all 18 index positions, and multiplys the value of i by 3

# Note this does not multiply the value stored in the ith posistion of Eighteen_0s, only the value of i
for(i in 1:length(Eighteen_0s)){
  Eighteen_0s[i] <- i * 3
}
print(Eighteen_0s)


# 5c: Repeat part a to make a new vector of zeros. Then, make the first entry of that vector have a value of 1.

New_eighteen <- rep(0,18) # makes new vector of eighteen zeros
New_eighteen[1] <- 1  # assigns the first index position the value of 1
print(New_eighteen) 


# 5d: Write a for loop so that starting with the second entry of the vector created in part c, the value stored in that position in the vector is equal to one plus twice the value of the previous entry (i.e., 1 + (2 * previous entry) ).

# loop starts with the second index and performs the calculation based on the value of i - 1
for(i in 2:length(New_eighteen)){
  New_eighteen[i] <- 1 + (2 * New_eighteen[i - 1])
}
print(New_eighteen)


# Part 2 step 6: Using the information given in that quote (and using a for loop), write code that makes a vector of the first 20 Fibonacci numbers, where the first number is 0 (zero).

Fibonacci_numbers <- rep(0,20)
Fibonacci_numbers[2] <- 1 # If we start with 0, we must assign the next position 1 or we will never accumulate. 0 + 0 will always equal 0.
for(i in 3:length(Fibonacci_numbers)){
  Fibonacci_numbers[i] <- Fibonacci_numbers[i - 1] + Fibonacci_numbers[i - 2]
}
print(Fibonacci_numbers)

# Part 2 step 7: 
# NOTE: I did make vector to store all population sizes, so here I will plot my vector(n) with a new vector(time)

time <- seq(1,12,1)
plot(time, n, pch = 18, col = "red")










