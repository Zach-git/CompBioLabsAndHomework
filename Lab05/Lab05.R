# Lab 5
# Part 1: Pacticing simple conditionals

# 1: Creat variable x, assign a random numeric value. Use if-else statement to determine if x>5

x <- sample(1:10,1,replace = TRUE) # I decided to try the sample function for the random number assignment

# if evaluates if x>5
# else only runs if x>5 is not TRUE
if(x > 5){  
  print("x is greater than 5")
}else{
  print("x is less than 5")
}

# 2: import ExampleData.csv
setwd("~/Desktop/EBIO4420/CompBioLabsAndHomework/Lab05")
Data <- read.csv('ExampleData.csv')

# Turns dataframe into vector 
Data_vector <- Data[[1]]

# 2a: Use a for loop to change every negative value to NA


for(i in 1:length(Data_vector)){
  if(Data_vector[i] < 0){  #evaluates for negatives
    Data_vector[i] <- NA   # changes all 0s to NA
  }
}


# 2b: used vectorized code to change all NA to NaN

Data_vector[is.na(Data_vector)] <- NaN  # is.na evaluates if a value is NA


# 2c: use which() to change all NaN to 0

NaN_index <- which(is.nan(Data_vector)) # evaluates which index positions have value of NaN

Data_vector[NaN_index] <- 0  # uses the indexes that have  NaN and assigns them 0


# 2d: determine how many values of Data_vector are between 50 and 100, including 50 & 100

Count <- rep(0, length(Data_vector))  # creates a vector to count the values of TRUE

for(i in 1:length(Data_vector)){
  if(Data_vector[i] >= 50 & Data_vector[i] <= 100){
   Count[i] <- 1   # assigns all true values as 1
  }
}

sum(Count) # adds all the ones together

# 2e: Create a new vector that stores these values

FiftyToOneHundred <- rep(NA, length(Data_vector))  # creates empty vector to store values of 50 to 100

for(i in 1:length(Data_vector)){
  if(Data_vector[i] >= 50 & Data_vector[i] <= 100){
    FiftyToOneHundred[i] <- Data_vector[i]
  }
}

FiftyToOneHundred <- FiftyToOneHundred[!is.na(FiftyToOneHundred)] # removes all value of NA

sum(Count) == length(FiftyToOneHundred) #checks to make sure our count matches the number of values in FiftyToOneHundred

# 2f: save vector in csv file

write.csv(x = FiftyToOneHundred, file = "FiftyToOneHundred.csv")


# 3: import CO2 data from lab 4
CO2_data <- read.csv('CO2_data_cut_paste.csv')

# 3a: Find first year where Gas emissions were non-zero

min(which(CO2_data$Gas != 0))

# 3b: find which years total emissions were between 200 & 300 metric tons

which(CO2_data$Total >= 200 & CO2_data$Total <= 300)





## Part 2: Loops + conditionals + biology
# calculate predator and prey over time using model


totalGenerations <- 1000
initPrey <- 100 	# initial prey abundance at time t = 1
initPred <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators

time <- seq(1,totalGenerations) # sequence to represent time

n <- rep(NA, totalGenerations)  # vector to store abundance of prey
n[1] <- initPrey # establishes initial value in first generation
p <- rep(NA, totalGenerations)  # vector to store abundance of predator
p[1] <- initPred  # establishes initial value in first generation


# perform model calculations using for loop
# model starts at gen 2 bc we already have initial values
# replace negative numbers with 0
for(t in 2:length(time)){
  n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
  p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])
  if(n[t] < 0){
    n[t] <- 0
  }
}



# plot abundances over time
# Hint: use lines or points to add pred/prey values

plot(time, type='n', xlab = "Generatons", ylab = "Abundance") #plots empty plot with time on bottom
lines(n, col = "dodgerblue") # adds prey abundances as a blue line
lines(p, col = "red")    # adds pred abundances as red line
legend("topright", legend = c("Prey Abundance","Predator Abundance"), col = c("dodgerblue","red"), lty = 1, cex = 0.8)  # adds legend



# create a matrix of TimeStep, PreyAbundance, PredAbundance then write to csv

myResults <- cbind(time,n,p)  # concatenates time, n, and p into one matrix
colnames(myResults)[1] <- "TimeStep"     # names column
colnames(myResults)[2] <- "PreyAbundance"
colnames(myResults)[3] <- "PredAbundance"

write.csv(x = myResults, file = "PredPreyResults.csv") 





