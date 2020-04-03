## Lab 11

install.packages("tidyverse")
library(tidyverse)

WoodData <- read.csv("GlobalWoodDensityDatabase.csv", stringsAsFactors = F)

str(WoodData)
colnames(WoodData)[4] <- "Wood density"
str(WoodData)


## Part 4
# 4a: which row is the missing data in?

which(is.na(WoodData$`Wood density`)) # row number of missing data

# 4b: remove that row

length(WoodData$`Wood density`) # check length
WoodData <- WoodData[-c(which(is.na(WoodData$`Wood density`))),] # remove NA row
length(WoodData$`Wood density`) # check that length decreased by 1
which(is.na(WoodData$`Wood density`)) # check for NAs again


## Part 5
# create a new data frame that:
# has each species listed only once,
# has the Family and Binomial information for each species, and
# has the mean of the Density measurements for each species


library(dplyr)

SpeciesMean <- aggregate(WoodData[,4], list(WoodData$Binomial, WoodData$Family), mean) # arranges Mean density column by species and family and calculates mean for each Species
colnames(SpeciesMean) <- c("Binomial", "Family", "Mean Density")



## Part 6
# 6a: Make a new data frame that has the average density for each Family (and no longer has individual species)

FamilyMean <- aggregate(WoodData[,4], list(WoodData$Family), mean) # arranges Mean Density column by Family and calculates mean for each family
colnames(FamilyMean) <- c("Family", "Mean Density")

nrow(FamilyMean)


# 6b: Sort the result of problem 6a by MeanDensity

ArrangedByMean <- arrange(FamilyMean, FamilyMean$`Mean Density`) # arranges the FamilyMean data by Mean density


# 6c: What are the 8 families with the highest average densities?
# What are the 8 families with the lowest average densities?


Highest8 <-  tail(ArrangedByMean$Family, n=8) # takes bottom 8 Families

Lowest8 <- head(ArrangedByMean$Family, n=8) # takes top 8 Families


## Part 7

library(ggplot2)

subsetHighest <- subset(WoodData, WoodData$Family %in% Highest8  ) # filter original data to include only highest 8 families
length(unique(subsetHighest$Family))

Highest8Plot <- ggplot(data = subsetHighest, aes(x = NULL, subsetHighest$`Wood density`)) +
  geom_boxplot() +
  facet_wrap(~subsetHighest$Family) # facet wrap so each graph is a Family 
+
  theme(axis.title.x=element_blank(),                           axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) # theme() allows for discription of axis ticks, titles, and text

Highest8Plot



# Repeat for Lowest 8

subsetLowest <- subset(WoodData, WoodData$Family %in% Lowest8  ) # filter original data to include only lowest 8 families
length(unique(subsetHighest$Family))

Lowest8Plot <- ggplot(data = subsetLowest, aes(x = NULL, subsetLowest$`Wood density`)) +
  geom_boxplot() +
  facet_wrap(~subsetLowest$Family) # facet wrap so each graph is a Family + 
  theme(axis.title.x=element_blank(),                           axis.text.x=element_blank(),
                                                               axis.ticks.x=element_blank()) # theme() allows for discription of axis ticks, titles, and text

Lowest8Plot


## Part 7
# flip axis

Highest8Flipped <- ggplot(data = subsetHighest, aes(x = subsetHighest$Family, subsetHighest$`Wood density`)) +
  geom_boxplot() +
  coord_flip() #flips axis
Highest8Flipped



Lowest8Flipped <- ggplot(data = subsetLowest, aes(x = subsetLowest$Family, subsetLowest$`Wood density`)) +
  geom_boxplot() +
  coord_flip() 
Lowest8Flipped




