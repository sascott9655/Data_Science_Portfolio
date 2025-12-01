balloon <- read.csv('C:/Users/samsc/Desktop/ADS-500B/Data_and_Code2/balloons.csv', header=T, sep=',')
View(balloon)
#make all columns factors in this dataset
is.factor(balloon$Size)

x = c('Color', 'Size', 'Act', 'Age', 'Inflated')
balloon[x] = lapply(balloon[x], as.factor)


#install.packages('party')
library(party)
View(balloon)
inflated.Tree <- ctree(Inflated~.,data=balloon)
plot(inflated.Tree)
