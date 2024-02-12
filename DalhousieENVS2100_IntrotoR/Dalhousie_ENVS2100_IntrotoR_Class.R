##Introduction to R

#this is a comment

##Getting started
#simple math
2+5 #run this line by highlighting it and then typing CTL + ENTER or putting your cursor on the 7 and clicking 'Run'

#saving data to variables
a <- 2+5
b <- 3

#functions act on variables; commas separate variables
sum(a,b)

#dataframes are unique to R and very useful
#lets you view the entire dataframe in a separate window, unique to RStudio
View(iris)

#shows you the first 6 lines
head(iris)

#other summarizing functions
summary(iris)
str(iris)

#learning how to work with dataframes
iris$Sepal.Length
iris$Sepal.Length[iris$Species == "setosa"]
levels(iris$Species)
iris$Petal.Length[iris$Species == "setosa"]

#simple plotting
?plot
plot(x = iris$Sepal.Length, y = iris$Sepal.Width)

#add a straight line? Search "add a straight line in r base plot" 
# http://www.sthda.com/english/wiki/abline-r-function-an-easy-way-to-add-straight-lines-to-a-plot-using-r-software#:~:text=The%20R%20function%20abline(),%3DNULL%2C%20...)
plot(x = iris$Sepal.Length, y = iris$Sepal.Width)
abline(h = 3, col = "red")

#now let's download some actual coral data!!
# Download data from here: http://tinyurl.com/ENVS2100RData 

##Load in the data!
#Manual Method
#File -> Open File... -> Click on the .RData file and say 'Yes'

#R Method
setwd() #set this to your Downloads folder or wherever you downloaded the file to
#file path to your downlaods folder should look something like "C:/Users/akg6325/Documents"
getwd() #to check that you're in your downloads folder
load("avgdata_ENVS2100_IntrotoR.RData")

#Look at the Data, use the methods we talked about before
head(Data)



#Simple plots of the Data
plot(x = Data$Date[Data$Site == ""], y = Data$Macroalgae[Data$Site == ""])

plot(x = Data$Date[Data$Site == ""], y = Data$HardCoral[Data$Site == ""], xlab = "", ylab = "", main = "", pch = 20, col = "")
abline(h = 30, col = "red")



#now make some plots of your own to determine if the reefs in Moorea are healthy 
#Is hard coral cover increasing or decreasing over time?
##Does location matter?

#Recall: Healthy coral reef = 30% hard coral cover
##How many reefs are above this threshold?
##Is this changing over time?

#ADD DESCRIPTION OF THE DATA HERE


##FULL CODE: https://github.com/ArielGreiner/TeachingMaterials/blob/main/DalhousieENVS2100_IntrotoR/Dalhousie_ENVS2100_IntrotoR_Full.R 
##DATA SOURCE: The initial data 'knb-lter-mcr.4_2_20240105.csv' was downloaded from https://portal.edirepository.org/nis/mapbrowse?packageid=knb-lter-mcr.4.40, by clicking on the "2. Percent Cover - Wide Table" download.

