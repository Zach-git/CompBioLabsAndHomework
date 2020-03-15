## Lab09
## Parsing Dates and Times from a Real Data File


# Part 1

# import data with stringsasFactors = False
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)
str(camData)
head(camData)
tail(camData)


?strptime


# subset the data
smallVec <- camData$DateTime[1:5]
str(smallVec)


date <- camData$DateTime[1]


# strptime(date, format = '%m/%d/%Y %H:%M', tz = '') # does not work; returns NA
# strptime('date', format = '%m/%d/%Y %H:%M', tz = '') # does not work; returns NA
strptime('19/09/2013 16:29', format = '%d/%m/%Y %H:%M', tz = '') # works but cannot get rid of seconds or timezone




# as.Date(date,format='%m/%d/%Y %H:%M', tz = '') # does not work; returns NA
# as.Date('date',format='%m/%d/%Y %H:%M', tz = '') # does not work; returns NA
# as.Date("19/09/2013 16:29",format='%m/%d/%Y %H:%M', tz = '') # does not work; returns NA




install.packages("lubridate")
library(lubridate)


dmy_hm("19/09/2013 16:29") # works but cannot remove seconds or timezone

first5 <- camData$DateTime[1:5]
str(first5)



# converted <- for(i in 1:length(first5)){
# strptime(first5[i], format = '%d/%m/%Y %H:%M')
# }   # does not work; returns NULL vector



# converted <- for(i in 1:length(first5)){
#  dmy_hm(first5[i])
# }   # does not work; returns NULL vector


converted <- dmy_hm(camData$DateTime) # seems to work on the whole vector
str(converted) # everything is POSIXct
head(converted)
tail(converted)

View(converted)



# Problem 2
#  make sure all years are in 4-digit format

years <- year(converted) # pulls out all the years from the converted vector
length(years)
str(years)


# I designed this for loop to print any year that is not 2013 or 2014
for(i in 1:length(years)){
  if(years[i] != 2013 && years[i] != 2014){
    print(years[i])
  }
}
# due to the lack of prints... assuming that my four loop works correctly.... then I should have no two-digit years in my vector

camData$DateTime[14604] # originally a 2-digit year
converted[14604] # now a 4-digit year


# Problem 3
# my vector operation seemed to work... if it didn't, I would use that for loop to pull out the index positions of the two-digit years, then work on converting those directly.



# Problem 4
# develop a way to find the average time between observations for a given Season, Station, and Species


# Will continue working on this function....


# avg_time_between <- function(data, convertedTimes, Season, Station, Species){
#   for(i in 1:length(data){
#      if(data$Season == Season){
#         Season <-  
#}
#       data$Species == Species
#       data$Station == Station
#   }
# }










