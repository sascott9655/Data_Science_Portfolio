#stoneflakes dataset which contains measurement of the flakes from the waste
#products of the crafting process by prehistoric men

StoneFlakes <- read.csv('C:/Users/samsc/Desktop/ADS-500B/Data_and_Code2/StoneFlakes.csv', header=T, sep=',')
#View(StoneFlakes)

#removing unneccessary X column
StoneFlakes <- subset(StoneFlakes, select = -X)
StoneFlakes <- subset(StoneFlakes, select = -ID)
#View(StoneFlakes)


#There is missing data denoted by ? and 0. We will remove the missing data.
#To do this, we first remove the non-numeric attribute and the output data would
#be standardized before processing clusters. If data value are non-numeric you 
#would need to convert them to numbers before standardizing with scale().

StoneFlakes[StoneFlakes == '?'] <- NA
StoneFlakes <- na.omit(StoneFlakes)
#View(StoneFlakes)

#Converting data entries into numbers
StoneFlakes$LBI <- as.numeric(StoneFlakes$LBI) #just like in Python
StoneFlakes$FLA <- as.numeric(StoneFlakes$FLA)
StoneFlakes$PSF <- as.numeric(StoneFlakes$PSF)
StoneFlakes$FSF <- as.numeric(StoneFlakes$FSF)
StoneFlakes$ZDF1 <- as.numeric(StoneFlakes$ZDF1)

View(StoneFlakes)

#Standardizing the data
StoneFlakes <- scale(StoneFlakes)

library(cluster)
aclusters <- agnes(StoneFlakes, method="complete") #agglomerative
aclusters$ac #agglo coefficient
plot(aclusters)



#Credit to Shah 2020