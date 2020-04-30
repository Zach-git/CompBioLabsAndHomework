## Zachary Girard
## CompBio Spring 2020
## Final Project

# Read in data. Make sure csv file is contained in your working directory. Please set that working directory now.

turtles <- read.csv('dataset_seaturtles.csv', header = T, na.strings = c("", "NA"))  # na.strings = c("", "NA") replaces all empty character strings with NA

# Some simple evaluations to familiarize yourself with the data and structure. 
head(turtles)
str(turtles)
length(turtles)
nrow(turtles)

which(is.na(turtles))
which(is.na(turtles), arr.ind = T)


# Heat Map Visualization

# These packages are necessary for the following analyses and visualizations. Please run these library calls. 
library(dplyr)
library(ggplot2)
library(data.table)

# ggplot2 and the 'world' data it contains prefers to work with 'lat' and 'long' as names for coordinate data. So, I changed the column names for ease of use. 
colnames(turtles)[3] <- "long"
colnames(turtles)[4] <- "lat"
as.data.frame(turtles)


# This is the 'world' data as provided by ggplot2. We are placing the data in a data table to create a world map as a background
World <- map_data('world') %>% data.table()


WorldMap <- ggplot(World, aes(long, lat)) + 
  geom_polygon(aes(group=group),fill="white",colour="black",size=0.15) + # sets country borders size
  coord_equal() + 
  scale_x_continuous(expand=c(0,0)) + 
  scale_y_continuous(expand=c(0,0)) +
  labs(x='Longitude', y='Latitude') +
  theme_bw() + 
  geom_count(data = turtles, aes(color = ..n.., size = ..n..)) + # makes size and color of points correspond to the count 
  guides(color = 'legend') +
  scale_size(range = c(0.25, 3)) + # sets size limits on points
  scale_color_gradient(low = "green", high = "red") # colors points by frequency
 
# Call to view plot
WorldMap 







# Histogram of salinity

salinity_hist <- ggplot(data = turtles, aes(x = turtles$BO_salinity)) +
  geom_histogram(color = "red", binwidth = 0.5, aes(fill = ..count..)) + # sets width of bins and fills the inside of bar by relative count
  scale_fill_gradient("Count", low="green", high="red") + # colors legend scale by count (green = few observations & red = lots of observations)
  geom_vline(aes(xintercept=mean(turtles$BO_salinity)),color="black", linetype="dashed", size=1) + # adds vertical line at mean
  xlim(c(25,45)) +  # limits x axis to portion where observations occur
  labs(title="Histogram for Salinity", x="Salinity (g/kg)", y="Count") # adds title
  

# Call to view plot
salinity_hist





# Histogram of pH

# Creates a histogram of observation counts across pH levels. 
pH_hist <- ggplot(data = turtles, aes(x = turtles$BO_ph)) +
  geom_histogram(color = "purple", binwidth = 0.05, aes(fill = ..count..)) + # sets width of bins and fills the inside of bar by relative count
  scale_fill_gradient("Count", low="red", high="blue") + # colors legend scale by count (red = few observations & blue = lots of observations)
  geom_vline(aes(xintercept=mean(turtles$BO_ph)),color="black", linetype="dashed", size=1)  + # adds vertical line at mean
  xlim(c(7,9)) + # limits x axis to portion where observations occur
  labs(title="Histogram for pH", x="pH", y="Count") # adds titles

# Call to view plot
pH_hist






# Bar graph of species counts

# Creates a Species count table.
SpeciesCount <- turtles %>% group_by(turtles$scientificname) %>% summarize(count=n()) # takes the data, pipes to group by Species, and then summarizes each species by the number of times it appears in the dataframe
colnames(SpeciesCount) <- c("Species", "Count") #rename columns for clarity

# This returns us 1 row at the bottom with counts in which the name was NA.
# For visualization purposes I will remove that row

SpeciesCount <- SpeciesCount[-c(nrow(SpeciesCount)), ]



# Produces a bar plot with species names on y axis and counts on a logarithmic x axis. Species names will appear from most common on the bottom and least common on top.

FlippedBarPlot <- ggplot(data = SpeciesCount, aes(x = reorder(SpeciesCount$Species, -SpeciesCount$Count), SpeciesCount$Count)) + # reorder orders the way they appear on y axis as least to most common
  geom_bar(stat ="identity") + 
  xlab("Species") + 
  ylab("Count") + 
  coord_flip() + # flips axis
  scale_y_log10() # makes log scale

# Call to view plot
FlippedBarPlot  







