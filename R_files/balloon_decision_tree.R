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

#Random forest

set.seed(1)
population <- sample(nrow(balloon), 0.80* nrow(balloon))
train <- balloon[population,]
test <- balloon[-population,]

library(randomForest)

model <- randomForest(Inflated~.,data=train)
model

prediction <- predict(model, newdata=test)
table(prediction, test$Inflated)

prediction[1,1] + prediction[2,2]/nrow(test)
