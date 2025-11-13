size = read.table('C:/Users/samsc/Desktop/ADS-500B/Data_and_Code2/OA 6.4 - size.csv', header=T, sep=',')
size
summary(size)

library(ggplot2)
ggplot(size, aes(x=Height,y=Weight)) + geom_point() + ylim(100,200)