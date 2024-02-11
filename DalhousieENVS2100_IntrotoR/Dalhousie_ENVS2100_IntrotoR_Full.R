##Introduction to R

##Getting started
#simple math
2+5 

#saving data to variables
a <- 2+5
b <- 3

#functions act on variables
sum(a,b) #commas separate variables

#dataframes are unique to R and very useful
#lets you view the entire dataframe in a separate window, unique to RStudio
View(iris) 
#shows you the first 6 lines
head(iris)
#other summarizing functions
summary(iris) #big overview of the data
str(iris) #a bit more technical

#simple plotting
plot(iris$Sepal.Length, iris$Sepal.Width) #$ to select specific column in the dataframe
?plot #what does each position (vis a vis commas) mean?
plot(x = iris$Sepal.Length, y = iris$Sepal.Width)

#more complex plotting 
#ggplot2 is a package for making more advanced plots
#2 Methods to Install it
#need to choose a CRAN mirror to download from, I usually choose Ontario (in Canada)

#Method 1: Manual - Tools -> Install Packages... -> type in 'ggplot2', click yes to install dependencies also
#Method 2:
install.packages("ggplot2") #make sure to install dependencies also!

library(ggplot2)
ggplot(aes(x = Sepal.Length, y = Sepal.Width, col = Species), data = iris)+ #add '+' to indicate that you're adding another element to the plot
  geom_point()


#now let's download some actual coral data!!
# Download data from here: http://tinyurl.com/ENVS2100RData 

##Load in the data!
#Manual Method
#File -> Open File... -> Click on the .RData file and say 'Yes'

#for windows: <NEED TO CHECK THIS, SOME WEIRD // SITUATION>
#for mac: right click on the file, click on inspect element, copy paste the file path into the code below
#e.g. on my computer  
load(file = "~/Dropbox/Github/TeachingMaterials/DalhousieENVS2100_IntrotoR/avgdata_ENVS2100_IntrotoR.RData") #it's called 'avgdata'

#Look at the Data
View(Data) 
head(Data)
summary(Data) 
str(Data)

#Data Description
#ADD DESCRIPTION OF THE DATA HERE


#show them how to code a simple plot of the data
plot(x = Data$Date[Data$Site == "LTER 1"], y = Data$HydroCoral[Data$Site == "LTER 1"], pch = 20, xlab = "Year", ylab = "Hard Coral Cover (Stress Tol)", main = "LTER 1")

#ADD MORE PLOTS HERE

#now make some plots of your own to determine if the reefs in Moorea are healthy 
#Is hard coral cover increasing or decreasing over time?
##Does location matter?
##What about stress tolerant hard coral, specifically?

#Recall: Healthy coral reef = 30% hard coral cover
##How many reefs are above this threshold?
##Is this changing over time?







  

###RESOURCES
#some other plots they could make

##Basic Scatter plot - Shows how hard coral cover changes over time in LTER 1
#try changing the site by changing "LTER 1" to another LTER or changing the benthic type by changing "HardCoral" to "Macroalgae" or some other benthic type after the '$' sign in the response variable (y) 
plot(x = Data$Date[Data$Site == "LTER 1"], y = Data$HardCoral[Data$Site == "LTER 1"], pch = 20, xlab = "Year", ylab = "Hard Coral Cover", main = "LTER 1")

#same plot as above, with a line marking 30% cover
plot(x = Data$Date[Data$Site == "LTER 1"], y = Data$HardCoral[Data$Site == "LTER 1"], pch = 20, xlab = "Year", ylab = "Hard Coral Cover", main = "LTER 1", ylim=c(0,1))
abline(h=0.3, col = "red") 

#can also plot another benthic variable on the same plot using points()
plot(x = Data$Date[Data$Site == "LTER 1"], y = Data$HydroCoral[Data$Site == "LTER 1"], pch = 20, xlab = "Year", ylab = "Hard Coral Cover", main = "LTER 1", ylim=c(0,1))
points(x = Data$Date[Data$Site == "LTER 1"], y = Data$Macroalgae[Data$Site == "LTER 1"], pch = 20, col = "blue")
abline(h=0.3, col = "red") 
#NOTE TO ARIEL: ADD LEGEND HERE

##Basic Scatter plot - Shows how hard coral cover varies across space in 2005
#try changing the year by changing 2005 to another year or changing the benthic type by changing "HardCoral" to "Sand" or some other benthic type after the '$' sign in the response variable (y) 
#as.factor() changes that vector into a factor variable, enabling it to be plotted along the x-axis since factor variables are ordered character variables  
plot(x = as.factor(Data$Site[Data$Date == 2005]), y = Data$HardCoral[Data$Date == 2005], xlab = "Site", ylab = "Hard Coral Cover", main = "2005")

#GGPLOTS

##Basic Scatter plot - Shows how hard coral cover changes over time in LTER 1
#try changing the site by changing "LTER 1" to another LTER or changing the benthic type by changing "y = HardCoral" to "y = Macroalgae" or some other benthic type 
ggplot(aes(x = Date, y = HardCoral), data = Data[Data$Site == "LTER 1",])+
  ggtitle("LTER 1")+ #add '+' to indicate that you're adding another element to the plot
  geom_point()

#same plot as above, with a line marking 30% cover
#couldn't remember how to do this, so looked up 'add horizontal line to ggplot' and found http://www.sthda.com/english/wiki/ggplot2-add-straight-lines-to-a-plot-horizontal-vertical-and-regression-lines 
ggplot(aes(x = Date, y = HardCoral), data = Data[Data$Site == "LTER 1",])+
  ggtitle("LTER 1")+ #add '+' to indicate that you're adding another element to the plot
  geom_point()+
  geom_hline(yintercept = 0.3, col = "red")

#can also plot another benthic variable on the same plot by adding another geom_point() line
ggplot(aes(x = Date, y = HardCoral), data = Data[Data$Site == "LTER 1",])+
  ggtitle("LTER 1")+ #add '+' to indicate that you're adding another element to the plot
  geom_point()+
  geom_point(aes(x = Date, y = Macroalgae), col = "blue")+
  geom_hline(yintercept = 0.3, col = "red")
#NOTE TO ARIEL: ADD LEGEND HERE

##SPATIAL PLOTTING
library(maps) #CHECK IF THIS IS A DEPENDENCY IN GGPLOT2
library(ggplot2)
#this plot is a bit more advanced, but you can still play around with it by changing which benthic type determines the colouration by changing 'colour' of geom_point below

#correct the longitude because the map is from 0 -> 360 and the longitude is currently ~-149
Data$Longitude_corrected <- Data$Longitude +360

worldmap <- map_data ("world", wrap = c(0, 360))
ggplot(aes(x = long, y = lat), data = worldmap) + 
  geom_polygon(aes(group = group), fill="gainsboro", colour = "gainsboro") +
  xlab("Longitude") + ylab("Latitude")+ 
  geom_point(data = Data[Data$Date == 2005,], aes(x = Longitude_corrected, y = Latitude, colour = HardCoral))+ #, colour = cl.c
  coord_cartesian(xlim = c(209,212), ylim = c(-17,-18)) +
  theme_bw()

#some help guides
# Base R plotting guide: http://www.sthda.com/english/wiki/r-base-graphs
# ggplot plotting guide: https://rstudio.github.io/cheatsheets/html/data-visualization.html, https://datacarpentry.org/R-ecology-lesson/04-visualization-ggplot2.html

###ADD DATA MANIP CODE ALSO
