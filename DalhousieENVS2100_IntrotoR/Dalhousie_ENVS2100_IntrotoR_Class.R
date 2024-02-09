##Introduction to R

##Getting started
#simple math


#saving data to variables



#functions act on variables; commas separate variables

#dataframes are unique to R and very useful
#lets you view the entire dataframe in a separate window, unique to RStudio


#shows you the first 6 lines


#other summarizing functions



#simple plotting



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



#simple data manipulation


#show them how to code a simple plot of the data


#in ggplot



#now make some plots of your own to determine if the reefs in Moorea are healthy 
#Is hard coral cover increasing or decreasing over time?
##Does location matter?
##What about stress tolerant hard coral, specifically?

#Recall: Healthy coral reef = 30% hard coral cover
##How many reefs are above this threshold?
##Is this changing over time?






