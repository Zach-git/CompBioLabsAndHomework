## Lab 12

# Part 1

data <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14 copy.csv", header = T)
str(data)
head(data)


library(tidyverse)
library(dplyr)

SpeciesCount <- data %>% group_by(data$Species) %>% summarize(count=n()) # takes the data, pipes to group by Species, and then summarizes each species by the number of times it appears in the dataframe
colnames(SpeciesCount) <- c("Species", "Count") #rename columns for clarity

# Problem 1:

BarPlot <- ggplot(data = SpeciesCount, aes(x = SpeciesCount$Species, SpeciesCount$Count)) + geom_bar(stat ="identity") + xlab("Species") + ylab("Count")   # simple ggplot, not that stat="identity" is necessary for this type of barplot  

BarPlot

# Problem 2:

FixedBarPlot <- ggplot(data = SpeciesCount, aes(x = SpeciesCount$Species, SpeciesCount$Count)) + geom_bar(stat ="identity") + theme(axis.text.x = element_text(angle = 90)) + xlab("Species") + ylab("Count")    # same plot as before, but now with the x axis ticks rotated 90 degrees                        
  
FixedBarPlot


  
# Problem 3
  
FlippedBarPlot <- ggplot(data = SpeciesCount, aes(x = reorder(SpeciesCount$Species, -SpeciesCount$Count), SpeciesCount$Count)) + geom_bar(stat ="identity") + xlab("Species") + ylab("Count") + coord_flip() + scale_y_log10()

# this plot adds coord_flip to flip axis, scale_y_log10 to create logarithmic axis, and reorder to reorder the species by lowest count 

FlippedBarPlot  









