##Introduction to R

#this is a comment

##Getting started
#simple math
2+5 #run this line by highlighting it and then typing CTL + ENTER or putting your cursor on the 7 and clicking 'Run'

#saving data to variables
a <- 2+5
b <- 3

#functions act on variables
sum(a,b) #commas separate variables within round brackets

#dataframes are unique to R and very useful
#lets you view the entire dataframe in a separate window, unique to RStudio
View(iris) 
#shows you the first 6 lines
head(iris)
#other summarizing functions
summary(iris) #big overview of the data
str(iris) #a bit more technical

#learning how to work with dataframes, square brackets
iris$Sepal.Length
iris$Sepal.Length[iris$Species == "setosa"] #need to put 'setosa' in quotes so that it doesn't think that it's an object
levels(iris$Species)
iris$Petal.Length[iris$Species == "setosa"]

#simple plotting
?plot #what does each position (vis a vis commas) mean?
plot(x = iris$Sepal.Length, y = iris$Sepal.Width)

#add a straight line? Search "add a straight line in r base plot" 
# http://www.sthda.com/english/wiki/abline-r-function-an-easy-way-to-add-straight-lines-to-a-plot-using-r-software#:~:text=The%20R%20function%20abline(),%3DNULL%2C%20...)
plot(x = iris$Sepal.Length, y = iris$Sepal.Width)
abline(h = 3, col = "red")

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
# Download data from here: http://tinyurl.com/ENVS2100RData aka https://github.com/ArielGreiner/TeachingMaterials/raw/main/DalhousieENVS2100_IntrotoR/avgdata_ENVS2100_IntrotoR.RData

##Load in the data!
load(url("https://github.com/ArielGreiner/TeachingMaterials/raw/main/DalhousieENVS2100_IntrotoR/avgdata_ENVS2100_IntrotoR.RData"))

#Manual Method
#Download from https://github.com/ArielGreiner/TeachingMaterials/raw/main/DalhousieENVS2100_IntrotoR/avgdata_ENVS2100_IntrotoR.RData and then...
#File -> Open File... -> Click on the .RData file and say 'Yes'

#R Method
setwd() #set this to your Downloads folder or wherever you downloaded the file to
#file path to your downlaods folder should look something like "C:/Users/akg6325/Documents"
getwd() #to check that you're in your downloads folder
load("avgdata_ENVS2100_IntrotoR.RData")

#Look at the Data, use the methods we talked about before
View(Data) 
head(Data)
summary(Data) 
str(Data)

#NOTES ON DATA
#Date: Year Data was collected
#Site: The Moorea LTER that Data was collected from
#Latitude, Longitude: Coordinates of the LTER in question
#Benthic Organism Columns (5-9): Percent of LTER covered by that organism (or sand)

#Simple Plots of the Data
plot(x = Data$Date[Data$Site == ""], y = Data$Macroalgae[Data$Site == ""])

plot(x = Data$Date[Data$Site == ""], y = Data$HardCoral[Data$Site == ""], xlab = "", ylab = "", main = "", pch = 20, col = "")
abline(h = 30, col = "red")

#now make some plots of your own to determine if the reefs in Moorea are healthy 
#Is hard coral cover increasing or decreasing over time?
##Does location matter?

#Recall: Healthy coral reef = 30% hard coral cover
##How many reefs are above this threshold?
##Is this changing over time?






  

###EXTRA RESOURCES
#some other plots they could make

##Basic Scatter plot - Shows how hard coral cover changes over time in LTER 1
#try changing the site by changing "LTER 1" to another LTER or changing the benthic type by changing "HardCoral" to "Macroalgae" or some other benthic type after the '$' sign in the response variable (y) 
plot(x = Data$Date[Data$Site == "LTER 1"], y = Data$HardCoral[Data$Site == "LTER 1"], pch = 20, xlab = "Year", ylab = "Hard Coral Cover", main = "LTER 1")

#same plot as above, with a line marking 30% cover
plot(x = Data$Date[Data$Site == "LTER 1"], y = Data$HardCoral[Data$Site == "LTER 1"], pch = 20, xlab = "Year", ylab = "Hard Coral Cover", main = "LTER 1")
abline(h=0.3, col = "red") 

#can also plot another benthic variable on the same plot using points()
plot(x = Data$Date[Data$Site == "LTER 1"], y = Data$HardCoral[Data$Site == "LTER 1"], pch = 20, xlab = "Year", ylab = "Benthic Cover", main = "LTER 1")
points(x = Data$Date[Data$Site == "LTER 1"], y = Data$Macroalgae[Data$Site == "LTER 1"], pch = 20, col = "blue")
abline(h=0.3, col = "red") 
legend(2005, 40, legend=c("Hard Coral","Macroalgae"),col=c("black","blue"), pch = rep(20,4), cex=0.8, xjust = 0, yjust = 1)
#^ can use code like what is shown above to put a legend on a plot

#to save a plot, can put png() and dev.off() around the code, for example
png("") #add the file path to your chosen folder, with the desired name of the plot followed by .png in the quotes
#e.g. on my computer, I could use "/Users/akg6325/Dropbox/Github/TeachingMaterials/hardcoral_malg_simpleplot.png"
plot(x = Data$Date[Data$Site == "LTER 1"], y = Data$HardCoral[Data$Site == "LTER 1"], pch = 20, xlab = "Year", ylab = "Benthic Cover", main = "LTER 1")
points(x = Data$Date[Data$Site == "LTER 1"], y = Data$Macroalgae[Data$Site == "LTER 1"], pch = 20, col = "blue")
abline(h=0.3, col = "red") 
legend(2005, 40, legend=c("Hard Coral","Macroalgae"),col=c("black","blue"), pch = rep(20,4), cex=0.8, xjust = 0, yjust = 1)
dev.off() #to signify that the plotting for this plot has finished

##Basic Scatter plot - Shows how hard coral cover varies across space in 2005
#try changing the year by changing 2005 to another year or changing the benthic type by changing "HardCoral" to "Sand" or some other benthic type after the '$' sign in the response variable (y) 
#as.factor() changes that vector into a factor variable, enabling it to be plotted along the x-axis since factor variables are ordered character variables  
plot(x = as.factor(Data$Site[Data$Date == 2005]), y = Data$HardCoral[Data$Date == 2005], xlab = "Site", ylab = "Hard Coral Cover", main = "2005")


#GGPLOTS
library(ggplot2)

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

#to save a ggplot object, save it to an object (e.g. plot <- ggplot()) and then use ggsave(plot, filename = ".png"), can also add things like "bg = "transparent", height = 10, width = 10" after the filename
#e.g. ggsave(plot, filename = "/Users/akg6325/Dropbox/Github/TeachingMaterials/hardcoral_malg_ggplot.png", bg = "transparent", height = 10, width = 10)

##SPATIAL PLOTTING
library(maps) 
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


###DATA CLEANING
#When I downloaded the data from https://portal.edirepository.org/nis/mapbrowse?packageid=knb-lter-mcr.4.40 it was much messier than what I asked you all to download
#Below I show you how I transformed the data from the state it was in in that repository to 'Data'

#The initial data 'knb-lter-mcr.4_2_20240105.csv' was downloaded from https://portal.edirepository.org/nis/mapbrowse?packageid=knb-lter-mcr.4.40, by clicking on the "2. Percent Cover - Wide Table" download.

setwd("~/Dropbox/Github/TeachingMaterials/DalhousieENVS2100_IntrotoR/ExtraMaterials")

#Load in the .csv file (made reference to: https://teacherscollege.screenstepslive.com/a/1122473-import-data-in-r-csv-files-into-r-studio)
initialdata <- read.csv("knb-lter-mcr.4_2_20240105.csv") #Full path: "~/Dropbox/Github/TeachingMaterials/DalhousieENVS2100_IntrotoR/ExtraMaterials/knb-lter-mcr.4_2_20240105.csv"

names(initialdata) #look at the original column names

#R does not recognize 'na' as NA's, need to change them to a format R recognizes
dummy <- initialdata #just in case
initialdata[initialdata == "na"] <- NA #threw some error messages but it worked

#most of the columns are characters (same for dummy), it's going to be much easier to work with the columns with numbers in them if they are numeric
str(initialdata) 
for(i in 3:34){ #there are more efficient ways to do this but since I only have to do this once, doing it the inefficient way
  initialdata[,i] <- as.numeric(initialdata[,i])
}

#want to check if all of the rows sum to the same thing, to check my understanding of what this dataset is 
#can do that using rowSums (https://www.statology.org/rowsums-function-in-r/) and range() to check what the range of values are
range(rowSums(initialdata[,3:34], na.rm=T)) #0.0 1119.4, but most of them seem to be around 1090.9; so it seems like these are vaguely percent cover values

##going to make a handful of new columns and just put them at the end of the set of columns, for simplicity. Will move them around later.
#make a site column that just has 'LTER X' in it
#this will involve using reg ex expressions (used for cutting/splicing strings), which I never remember so I always look up how to do this
#https://stackoverflow.com/questions/56612262/remove-string-after-first-number-using-r-regex this answer came from here
initialdata$Site <- sub("^(\\D*\\d+).*", "\\1", initialdata$Location)

##add geographic coordinates to all of the sites
#levels(as.factor(initialdata$Site)) #this is a trick that I use when I know that a column contains only a handful of different strings and I want to know what they all are quickly. It is also handy as a troubleshooting method.
#can use it to extract the site codes easily
sites <- levels(as.factor(initialdata$Site)) #"LTER 1" "LTER 2" "LTER 3" "LTER 4" "LTER 5" "LTER 6"
#geographic coordinates given as north, south, east, west -> but i just want the centroid, so take the average of the N/S one (latitude) and E/W one (longitude)
initialdata$Site_Latitude <- NA
initialdata$Site_Longitude <- NA

lat_sites <- c(((-17.47185366-17.48641792)/2), 
               ((-17.46576169-17.48131958)/2), 
               ((-17.50382025-17.52087158)/2), 
               ((-17.53305021-17.55064263)/2),
               ((-17.56818162-17.59182383)/2),
               ((-17.50735955-17.52839766)/2))
long_sites <- c(((-149.8455917-149.829821)/2),
                ((-149.8116849-149.7961685)/2),
                ((-149.7708619-149.7519968)/2),
                ((-149.7772857-149.7566866)/2),
                ((-149.8869755-149.8561009)/2),
                ((-149.934537-149.9115336)/2))

for(i in 1:length(sites)){
  initialdata$Site_Latitude[initialdata$Site == sites[i]] <- lat_sites[i]
  initialdata$Site_Longitude[initialdata$Site == sites[i]] <- long_sites[i]
}

##convert the numbers in columns 3-34 to percentages of a total
#need a sum column first, see above for the code for that 
initialdata$totalcover <- rowSums(initialdata[,3:34], na.rm=T)

#making a new dataframe to make this a bit easier and to ensure that things are organized a bit more sensibly
#note: redefining CTB and Non_Coralline_Crustose_Algae as 'SmallAlgae_orBare', this isn't a perfect categorization but should suffice here 
#to do this, need to make a vector of these two being added together that treats the NA's properly
SmallAlgaeorBare <- rowSums(initialdata[,4:5], na.rm=T)
#dividing all of the columns with data by the total to turn them into proportions of the total
nonavg_data <- data.frame(Date = initialdata$Date, Site = initialdata$Site, Latitude = initialdata$Site_Latitude, Longitude = initialdata$Site_Longitude, HardCoral_Other = NA, HardCoral_StressTol = NA, Macroalgae = initialdata$Macroalgae/initialdata$totalcover, SoftCoral = initialdata$Soft_Coral/initialdata$totalcover, HydroCoral = initialdata$Millepora/initialdata$totalcover, SmallAlgae_orBare = (SmallAlgaeorBare)/initialdata$totalcover, Sand = initialdata$Sand/initialdata$totalcover, Unknown_or_Other = initialdata$Unknown_or_Other/initialdata$totalcover) 
#convert the hard coral data into 'stress tolerant hard coral' and 'other hard coral'
#referred to this paper to organize the genera: https://onlinelibrary.wiley.com/doi/full/10.1111/j.1461-0248.2012.01861.x 
nonavg_data$HardCoral_Other <- rowSums(initialdata[,c(9,10,15,16,17,18,22,25,26,27,28,30,31,32,33)], na.rm = T)
nonavg_data$HardCoral_StressTol <- rowSums(initialdata[,c(8,11,12,13,14,19,21,23,24,29)], na.rm = T)
#turning these into proportions also
nonavg_data$HardCoral_Other <- nonavg_data$HardCoral_Other/initialdata$totalcover
nonavg_data$HardCoral_StressTol <- nonavg_data$HardCoral_StressTol/initialdata$totalcover

#checking: range(rowSums(nonavg_data[,5:12], na.rm=T)) #range = 0-1, checked that they're all either 0 or 1 which is fair
checking <- rowSums(nonavg_data[,5:12], na.rm=T)
#some 0s in checking[9936:10936], these are from situations where the cover value is listed as 0

#take the average of all of the quadrats for each site for each year
years <- seq(2005,2022,1)
avgdata <- data.frame(Date = rep(years, each = length(sites)), Site = rep(sites,length(years)), Latitude = lat_sites, Longitude = long_sites, HardCoral_Other = NA, HardCoral_StressTol = NA, HydroCoral = NA, Macroalgae = NA, SoftCoral = NA, SmallAlgae_orBare = NA, Sand = NA, Unknown_or_Other = NA) 

for(i in 1:length(years)){
  for(j in 1:length(sites)){
    avgdata$HardCoral_Other[avgdata$Date == years[i] & avgdata$Site == sites[j]] <- mean(nonavg_data$HardCoral_Other[nonavg_data$Date == years[i] & nonavg_data$Site == sites[j]], na.rm = T)
    avgdata$HardCoral_StressTol[avgdata$Date == years[i] & avgdata$Site == sites[j]] <- mean(nonavg_data$HardCoral_StressTol[nonavg_data$Date == years[i] & nonavg_data$Site == sites[j]], na.rm = T)
    avgdata$HydroCoral[avgdata$Date == years[i] & avgdata$Site == sites[j]] <- mean(nonavg_data$HydroCoral[nonavg_data$Date == years[i] & nonavg_data$Site == sites[j]], na.rm = T)
    avgdata$Macroalgae[avgdata$Date == years[i] & avgdata$Site == sites[j]] <- mean(nonavg_data$Macroalgae[nonavg_data$Date == years[i] & nonavg_data$Site == sites[j]], na.rm = T)
    avgdata$SoftCoral[avgdata$Date == years[i] & avgdata$Site == sites[j]] <- mean(nonavg_data$SoftCoral[nonavg_data$Date == years[i] & nonavg_data$Site == sites[j]], na.rm = T)
    avgdata$SmallAlgae_orBare[avgdata$Date == years[i] & avgdata$Site == sites[j]] <- mean(nonavg_data$SmallAlgae_orBare[nonavg_data$Date == years[i] & nonavg_data$Site == sites[j]], na.rm = T)
    avgdata$Sand[avgdata$Date == years[i] & avgdata$Site == sites[j]] <- mean(nonavg_data$Sand[nonavg_data$Date == years[i] & nonavg_data$Site == sites[j]], na.rm = T)
    avgdata$Unknown_or_Other[avgdata$Date == years[i] & avgdata$Site == sites[j]] <- mean(nonavg_data$Unknown_or_Other[nonavg_data$Date == years[i] & nonavg_data$Site == sites[j]], na.rm = T)
  }
}

#just for simplicity, im going to recode the NaN's in this dataset as 0s because I do not know what they are but they will make things harder for the students if I leave them in
#used this https://www.statology.org/nan-in-r/ to figure out how to do this
avgdata$SoftCoral[which(is.na(avgdata$SoftCoral))] <- 0
avgdata$Unknown_or_Other[which(is.na(avgdata$Unknown_or_Other))] <- 0

#multiply all of the values by 100 to turn them into percentages, not proportions (more readable)
avgdata$HardCoral_Other <- avgdata$HardCoral_Other*100
avgdata$HardCoral_StressTol <- avgdata$HardCoral_StressTol*100
avgdata$HydroCoral <- avgdata$HydroCoral*100
avgdata$Macroalgae <- avgdata$Macroalgae*100
avgdata$SoftCoral <- avgdata$SoftCoral*100
avgdata$SmallAlgae_orBare <- avgdata$SmallAlgae_orBare*100
avgdata$Sand <- avgdata$Sand*100
avgdata$Unknown_or_Other <- avgdata$Unknown_or_Other*100

#restrict to 2 decimal places for it to look cleaner
#used https://stackoverflow.com/questions/3443687/formatting-decimal-places-in-r 
for(i in 5:12){
  avgdata[,i] <- as.numeric(format(round(avgdata[,i], 2), nsmall = 2))
}

#2.11.2024 - making the dataset much simpler
avgdata$HardCoral <- avgdata$HardCoral_Other + avgdata$HardCoral_StressTol
avgdata$Other <- avgdata$Unknown_or_Other + avgdata$HydroCoral + avgdata$SoftCoral

Data <- data.frame(Date = avgdata$Date, Site = avgdata$Site, Latitude = avgdata$Latitude, Longitude = avgdata$Longitude, HardCoral = avgdata$HardCoral, Macroalgae = avgdata$Macroalgae, SmallAlgae = avgdata$SmallAlgae_orBare, Other = avgdata$Other, Sand = avgdata$Sand)

Data$Site <- as.factor(Data$Site)

#now save this final dataset
save(Data, file = "avgdata_ENVS2100_IntrotoR.RData")
saveRDS(Data, file = "avgdata_ENVS2100_IntrotoR.rds")
#https://datatofish.com/export-dataframe-to-csv-in-r/ 
write.csv(Data, file = "avgdata_ENVS2100_IntrotoR.csv")
