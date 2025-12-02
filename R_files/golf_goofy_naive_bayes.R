golf <- read.csv('C:/Users/samsc/Desktop/ADS-500B/Data_and_Code2/OA 9.10 - golf.csv', header=TRUE, sep=',')
View(golf)

#package e1071 supports Naiv Bayes Theorem
#install.packages('e1071')
library(e1071)

set.seed(1)
id<- sample(2, nrow(golf), prob=c(0.7,0.3), replace=T)
golfTrain <- golf[id==1,]
golfTest <- golf[id==2,]

View(golfTrain)
View(golfTest)

golfModel <- naiveBayes(PlayGolf~.,data=golfTrain)
print(golfModel)

#a-priori probabilites are equivalent to Bayes Theorem prior probabilities. The
#prediction of an outcome is influenced not only by predictors, but also the 
#prevalence of the outcome


prediction <- predict(golfModel, newdata=golfTest)
print(prediction)

#it will be easier to read in a confusion matrix

#first gotta make variables factors of the same level
prediction <- factor(prediction, levels = c("Yes", "No"))
golfTest$PlayGolf <- factor(golfTest$PlayGolf, levels = c("Yes", "No"))

#install.packages('caret') -- for confusion matrix
library(caret)
confusionMatrix(prediction, golfTest$PlayGolf)

#33 percent accuracy is not good. We need more training examples to help this out.


#Credit to Shah 2020, using it only for learning