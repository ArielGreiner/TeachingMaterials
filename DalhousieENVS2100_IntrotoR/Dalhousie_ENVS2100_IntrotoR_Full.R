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
# Download code from here: http://tinyurl.com/ENVS2100RData 


##Load in the data!
#Manual Method
#File -> Open File... -> Click on the .RData file and say 'Yes'

#for windows: <NEED TO CHECK THIS, SOME WEIRD // SITUATION>
#for mac: right click on the file, click on inspect element, copy paste the file path into the code below
#e.g. on my computer  
load(file = "~/Dropbox/Github/TeachingMaterials/DalhousieENVS2100_IntrotoR/avgdata_ENVS2100_IntrotoR.RData") 


#look at the data

#show them how to code a simple plot of the data





###RESOURCES
#some other plots they could make
#other things from the other document
