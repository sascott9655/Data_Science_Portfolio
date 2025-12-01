#knn with iris dataset

#install.packages("ggvis")

library(ggvis)

iris %>% ggvis(~Sepal.Length, ~Sepal.Width, fill=~Species) #R syntax is strange. I need to get used to it.
#plots a scatterplot of data based on species and shows sepal length and width


#graph petal length and petal width
iris %>% ggvis(~Petal.Length, ~Petal.Width, fill=~Species)

#positive correlation between petal length and petal width

set.seed(1234)

#use sample function to ensure equal amount of each species in training and testing


ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.67,0.33)) #2 represents training and testing

iris.training <- iris[ind==1, 1:4]#training
iris.test <- iris[ind==2, 1:4]#test

#Species is our target variable. therefore store class label in factor vectors and divide them over the
#training and test sets

iris.trainLabels <- iris[ind==1,5]
iris.testLabels <- iris[ind==2,5]

#knn uses Euclidean distance to find similarities between the k-training instances and test instance

#building knn model

library(class)
iris_pred <- knn(train=iris.training, test=iris.test, cl=iris.trainLabels, k=3)
summary(iris_pred)

#lets evaluate how accurate the iris predictions are
#install.packages('gmodels')
library(gmodels)
CrossTable(x=iris_pred, y=iris.testLabels, prop.chisq=FALSE)

#Cell Contents
#|#---------------|
#|              #N|
#|    #N/Row Total|
#|    #N/Col Total|
#|  #N/Table Total|
#|#---------------|

#only predict one instance of the data incorrect where it predicting versicolor when
#it was virginica. I would say that is pretty accurate. So 50/51 is 98 percent




