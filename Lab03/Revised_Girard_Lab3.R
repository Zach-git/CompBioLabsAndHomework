## Lab03 script

# lab step #3: creating 2 variables for bag of chips and number of guest to start

chip_bags <- 5  
guests <- 8     


# lab step #5: create variable of number of chip bags consumed per guest

bag_per_guest <- 0.4


# lab step #7: calculate expected number of leftover chip bags
# The 1 denotes the addition of the host(self)
bags_leftover <- chip_bags - (bag_per_guest * (guests + 1))
# SMF COMMENT: Note that your calculation does not include chips eaten by you (the host)


# PART 2
#lab step #8: create 4 vectors with movie rankings from self & guests

Self <- c(7,9,8,1,2,3,4,6,5)
Penny <- c(5,9,8,3,1,2,4,7,6)
Lenny <- c(6,5,4,9,8,7,3,2,1)
Stewie <- c(1,9,5,6,8,7,2,3,4)

# lab step #9: create 2 variables of Penny and Lenny's episode 4 rankings

PennyIV <- Penny[4]
LennyIV <- Lenny[4]

# lab step #10: concatenate all 4 vectors into 1

All_4_rankings <- cbind(Self,Penny,Lenny,Stewie)


# lab step #11: evaluate structure of Penny, PennyIv, and All-4-rankings

str(Penny) # object contains a list of 9 numbers
str(PennyIV) # object contains 1 number(3)
str(All_4_rankings) # object contains a matrix with 4 rows and 9 columns


# lab step #12: make a data fram out of 4 rankings

Rankings_dataframe <- data.frame(Self,Penny,Lenny,Stewie)
Rankings_dataframe2 <- as.data.frame(Self,Penny,Lenny,Stewie) #produces error
Rankings_dataframe2 <- as.data.frame(All_4_rankings)
# SMF COMMENT:  NOTE that line 43 produces an error message and doesn't work!
# SMF COMMENT:  as.data.frame(All_4_rankings)  would have worked.  See the difference?

# lab step #13: describe similarities and differences of dataframe and cbind() object

dim(All_4_rankings) # dimensions are 9,4
dim(Rankings_dataframe) # dimensions are 9,4

str(All_4_rankings) # shows dimension(9,4), and 4 row names under chr
str(Rankings_dataframe) # shows 4 row names and their 9 columns

All_4_rankings == Rankings_dataframe # shows dataframe with all values as true under every column

typeof(All_4_rankings) # type: "double"
typeof(Rankings_dataframe) # type: "list


# lab step #14: make vector of episode names in numerals
Episode_names <- cbind("I", "II", "III", "IV", "V", "VI","VII","VIII", "IX")

# lab step #15: add row names

row.names(All_4_rankings) <- Episode_names
row.names(Rankings_dataframe) <- Episode_names


# lab step #16: print out third row of All_4_rankings

All_4_rankings[3,]
# SMF COMMENT:  There is nothing wrong with using print(), but note that it
# SMF COMMENT:  isn't necessary because a print to console is the default action

# lab step #17: print fourth column of Rankings_dataframe

Rankings_dataframe[,4]

# lab step #18: print self ranking for episode V

All_4_rankings[5,1]


# lab step #19: print Penny's ranking for episode II

All_4_rankings[2,2]

# lab step #20: print everyone rankings for episode 4-6

All_4_rankings[4:6,]

# lab step #21: print everyones rankings for episodes 2,5,and 7

All_4_rankings[c(2,5,7),]

# lab step #22: print just stewie and pennys rankings for episode 4 and 6

All_4_rankings[c(4,6),c(2,4)]


# lab step #23: changing lennys rankings for 2 and 5

All_4_rankings[c(2,5),3] <- All_4_rankings[c(5,2),3]
# SMF COMMENT: What is "10" and where does it come from?  10 is a magic number
# SMF COMMENT: and it doesn't seem to have a meaning here.  Also, note that 
# SMF COMMENT: the line of code on line 103 caused the loss of two data points in All_4_rankings 

# lab step #24: try example index on All_4_rankings and Rankings_dataframe

All_4_rankings["III", "Penny"]
Rankings_dataframe["III", "Penny"]
# SMF COMMENT: see comment above about magic numbers

# lab step #25: undo changes from step #23

All_4_rankings[c("V","II"), "Lenny"] <- All_4_rankings[c("II","V"), "Lenny"]

Rankings_dataframe[c("V","II"), "Lenny"] <- Rankings_dataframe[c("II","V"), "Lenny"]
# SMF COMMENT: more magic numbers 

# lab step #26: use $ method to redo changes from step #23

Rankings_dataframe$Lenny[c(2,5)] <- Rankings_dataframe$Lenny[c(5,2)]
 
# SMF COMMENT: more magic numbers
# SMF COMMENT: Try to find a way to do the swaps that does NOT use magic numbers
# SMF COMMENT: and instead uses indexing and an algorithm that does not cause
# SMF COMMENT: the loss of data.



