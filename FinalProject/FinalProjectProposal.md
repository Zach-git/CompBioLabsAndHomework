# Dude, Where's My Turtle?

## Introduction

For my final project, I will be analyzing a dataset consiting of empirical measurements taken during sea turtle observations. The goal of this project is to come away with some new information about trends in this dataset. I am doing this, because sea turtles such as the Green Turtle are now listed as Endangered by the IUCN Red List.[https://www.iucnredlist.org/species/4615/11037468](https://www.iucnredlist.org/species/4615/11037468) So, now more than ever it is important to gain as much knowledge as we can to assist in the recovery and conservation of these species. The main questions driving this project are: Where do observations occur most/least frequently. What climatic conditions most affect frequency of observations? Are there statistical differences in these effects between species?



<hr>

## Summary of Data to be Analyzed

The dataset I will be analyzing is from Portal da Biodiversidade [https://portaldabiodiversidade.icmbio.gov.br](https://portaldabiodiversidade.icmbio.gov.br), GBIF and Bio-Oracle [http://bio-oracle.org](http://bio-oracle.org). It was published in December 14, 2017. The project was a collaboration between the three companies in order to assess sea turtle observations.

### Goals of original study that produced the data 

Because the observation study was performed by a group of biodiversity organizations, the data was likely collected to maintain records of population sizes based on observation measurements. Unfortunately, it appears that no publications have come from this data. However, this allows me to make my own analysis from scratch. We can always hope that a great dataset like this will eventually be linked to a publication!


### Brief description of methodology that produced the data

There is not much of a description linked to this data. However, from checking out the different measurements taken, I think it is safe to assume that the data was collected by researchers making observations on the water. Measurements of pH, salinity, cloud cover, etc. were provided by Bio-Oracle, who assess "marine data layers for ecological modelling".

### Type of data in this data set:  

This dataset contains observation entries from around the globe. Each entry includes an ID, country code, coordinates, and scientific name,as well as 26 numeric measurements.

#### Format of data  

The data is available as a csv file on datadryad.org. It contains 5 interger columns, 25 numeric columns, and 2 columns with factors.Note that the first two columns, X & id, are arbitrary observation values and are irrelevant to any analyses. 


#### Size of data (i.e., megabytes, lines, etc.)

The csv file is 12.5 MB. It is 32 columns by 27,603 rows.  

#### Any inconsistencies in the data files?  Anything that looks problematic?  

There are 67 missing values in the dataset. All of these NAs occur in column 6, the country code. Those observations will not be used for any analyses. 

#### What the data represent about the biology? 

The data can tell us a lot about the preferred habits of sea turtles during peak observation times. By learning more about these habits, we can provide valuable knowledge to researchers who assess their population size, migration patterns, and habitats. This data could also be incorporated into a longitudinal study to examine changes in observations over time due to climate change and pollution. 


<hr>

## Detailed Description of Analysis to be Done and Challenges Involved

- My first aim is to provide a handy visualization of observation locations via the longitudinal and latitudinal data included with each observation. I hope to accomplish this via a heat map. The heat map will be able to provide not only the location of observations, but also the relative frequency of those observations. The hardest part of this will be to connect the frequency of the observation to some sort of color indicator.
 
- The second aim of the project is to analyze statistical trends in observations based on the climatic conditions present during the observation. For example: Are there more or less observations during high or low cloud cover? Does salinity effect observation frequency? Are there satistical differences in preferred pH between species?  To analyze these types of questions, I will perform linear regressions, paired t-tests, and chi-squared tests. This will be the most challenging aspect of the project. It will involve knowledge of statistical tests and how to interprete their results.




<hr>

## References 

Leocadio, J. (2017) Data from: Observations of sea turtles. Dryad Digital Repository. [https://doi.org/10.15146/R3J38K](https://doi.org/10.15146/R3J38K)


