# **Dude Where's My Turtle?**

## **Biological Question**
Where and under what conditions are Sea Turtle observations most common?

## **Introduction**

I am undertaking this project, because sea turtles such as the Green Turtle are now listed as Endangered by the IUCN Red List.[https://www.iucnredlist.org/species/4615/11037468](https://www.iucnredlist.org/species/4615/11037468)  So, now more than ever, it is important to gain as much knowledge as we can to assist in the recovery and conservation of these species.
The main questions driving this project are: Where do observations occur most/least frequently. Under what climatic conditions are observations most frequent?

## **Methods**
**Source of data:**

The dataset I will be analyzing is from Portal da Biodiversidade [https://portaldabiodiversidade.icmbio.gov.br](https://portaldabiodiversidade.icmbio.gov.br), GBIF and Bio-Oracle [http://bio-oracle.org](http://bio-oracle.org). It was published in December 14, 2017. The project was a collaboration between the three companies in order to assess global sea turtle populations.

There is not much of a description linked to this data. However, from checking out the different measurements taken, I think it is safe to assume that the data was collected by researchers making observations on the water or coastline. Measurements of pH, salinity, cloud cover, etc. were provided by Bio-Oracle, who assess "marine data layers for ecological modeling".

This dataset contains observational entries from around the globe. Each entry includes an ID, country code, coordinates, and scientific name, as well as 26 numeric measurements.

The data is available as a csv file on datadryad.org. The csv file is 12.5 MB. It is 32 columns by 27,603 rows. It contains 5 interger columns, 25 numeric columns, and 2 columns with factors. Note that the first two columns, X & id, are arbitrary observation values and are irrelevant to any analyses.


**What the original authors did with the data:**

Because the observation study was performed by a group of biodiversity organizations, the data was likely collected to maintain records of population sizes based on observational measurements. Unfortunately, it appears that no publications have come from this data. While there are thousands of publications based on similar GBIF data, I cannot confirm that this specific dataset led to any publications.


**What YOU did with the data and how you did it:**

My analysis starts by loading in the data. I then check for aspects of structure, length, and missing values. Then a world map is created with data provided in the ggplot2 package. The map is used a background to plot observation coordinates. The points are colored and sized by the number of observations at that coordinate. Then a histogram is created for both salinity and pH. The histogram shows counts of observations within the groupings, across the salinity and pH scales. X axis of the histograms are limited to show only the portion in which there are observations. Finally, a bar graph is created to show counts of species. The species names appear from least to most common on the y axis, with a logarithmic x axis.


## **Results and Conclusion**

I was able to visualize observation counts of sea turtles around the globe. This type of visualization is handy for researchers or students interested in where populations reside. It could also be used as a baseline for anyone wanting to keep track of populations on a temporal scale.

![World Map](https://github.com/Zach-git/CompBioLabsAndHomework/blob/master/FinalProject/WorldMap.png)


I also created two histograms that show the salinity and pH associated with the highest observation counts. The histograms show the distribution of observations across the salinity and pH scales. This type of visualization can inform researchers of what climatic conditions observations are most likely to be made.

![Salinity Histogram](https://github.com/Zach-git/CompBioLabsAndHomework/blob/master/FinalProject/SalinityHistogram.png)

![pH Histogram](https://github.com/Zach-git/CompBioLabsAndHomework/blob/master/FinalProject/pHHistogram.png)


Finally, I made a bar graph for species count. This shows which species were observed from most to least common. This can inform researchers of which species may be experiencing population declines.

![Species Bar Graph](https://github.com/Zach-git/CompBioLabsAndHomework/blob/master/FinalProject/SpeciesBarplot.png)





## **References Cited**
* Mieno, Taro. 2016. “Creating a Heat Map using **ggplot2**” Accessed April 14, 2020. http://khalo.github.io/r/spatial/2015/04/24/heatmap/

* mt1022. Edited January 25, 2018. “Color points by their occurrence count in ggplot2 geom_count.” Accessed April 14, 2020. https://stackoverflow.com/questions/45883097/color-points-by-their-occurrence-count-in-ggplot2-geom-count

* tidyverse, ggplot2. “Count overlapping points.” Accessed April 14, 2020. https://ggplot2.tidyverse.org/reference/geom_count.html

* STHDA. “ggplot2 histogram plot : Quick start guide - R software and data visualization.” Accessed April 24, 2020. http://www.sthda.com/english/wiki/ggplot2-histogram-plot-quick-start-guide-r-software-and-data-visualization

* Willems, Karlijn. 2019. “How to Make a Histogram with ggplot2.” Accessed April 24, 2020. https://www.datacamp.com/community/tutorials/make-histogram-ggplot2#axes2
