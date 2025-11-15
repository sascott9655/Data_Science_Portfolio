size = read.table('C:/Users/samsc/Desktop/ADS-500B/Data_and_Code2/OA 6.4 - size.csv', header=T, sep=',')
size
summary(size)

library(ggplot2)
ggplot(size, aes(x=Height,y=Weight)) + geom_point() + ylim(100,200)

#show linear regression model (line of best fit)
ggplot(size, aes(x=Height, y=Weight)) + geom_point() + stat_smooth(method="lm") + ylim(100,200)

#shows the equation of the line using lm command
lm(Weight ~ Height, size)

# Weight = 130.354 + 4.113 * Height  <---- linear model

#Maybe our graph is not all straight and linear like the equation. 

#creating a curved line
ggplot(size, aes(x=Height, y=Weight)) + geom_point() + geom_smooth() + ylim(100,200)

#the curved line fits the data much better than the linear regression line. 
#However the tradeoff of fitting the data better is ending up with overfitting or
#overlearning. It means we are able to model the existing data really well,
#but in the process, we compromise so much that training or predicting new data
#is more difficult. (Shah, 2020)
