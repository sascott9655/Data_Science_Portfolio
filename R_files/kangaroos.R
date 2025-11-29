#kangaroos

print(getwd())

#install.packages("readxl") (so i can read excel files)
library(readxl)

kangaroos <- read.csv('C:/Users/samsc/Desktop/ADS-500B/Data_and_Code2/kangaroos.xls', header=T, sep=',')

#x = nasal length
#y = nasal width

model <- lm(y~x, data=kangaroos)
summary(model) # crazy that a function can do all that

#gradient descent algorithm

attach(kangaroos)
plot(x,y,col=rgb(0.2,0.4,0.6,0.2), main = "Nasal length(x) vs. nasal width(y) of kangaroos")
#col=rgb() plots dots
abline(model, col='orange')



