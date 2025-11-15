#using classification in R with the wine dataset

wine = read.csv('C:/Users/samsc/Desktop/ADS-500B/Data_and_Code2/OA 5.4 - wine_quality.csv', header=T, sep=",")

#we want to know if a wine is high quality. so the high_quality is our 
#response or targer variable
#our indepenednet variables will be density, residual_sugar and sulfates to
#help see or predict if our wine is high quality

X_wine <- wine[,c("density", "sulfates", "residual_sugar")]
y_wine <- wine[,c("high_quality")]

# with X and y we can now split the data into training and testing. we use 
#"caret" which stands for "classification and regression training" It is a 
#package that requires installing. 

library(caret)
set.seed(123)
inTrain <- createDataPartition(y=y_wine, p=0.7, list=FALSE)

#reveal training and testing data. Testing data is whatever is not used in 
#training so 70/30 or 80/20 for example

X_train <- X_wine[inTrain,] # all rows, three columns (matrix or dataframe)
X_test <- X_wine[-inTrain,] #opposite of training is why - in front of -inTrain
y_train <- y_wine[inTrain] #no comma because y is only 1 dimension
y_test <- y_wine[-inTrain] # all rows , one column (vector or series)

#using kNN (k nearest neigbor) algorithm to build our model and use X_test to
#predict values for y. X_train and y_train help build the model with y_train being
#class labels. k = 3 meaning number of neighbors to consider. Each test point
# is classified based on the majority vote of its 3 nearest training neighbors.
# this will output a vector of predicted class labels for the test set

library(class)
wine_pred <- knn(train=X_train, test=X_test, cl=y_train, k=3)

#shows how well the model fits and how well the predictions are. using gmodels 
#library and CrossTable() function. it uses y_test vector 
#and compares it with the wine_pred vector to see how accurate the predictions
#of each wine quality was. The cross table
#will show four cells 0,0 and 1,1 are correct predictions and 0,1 and 1,0 are 
#incorrect predictions of wine quality. The cross table only used the testing or 
#30% of the data. propchisq indicates whether or not the chi-square contribution
#of each cell is included. the chi-square statistic is the sum of the contributions
#from each individual cells and is used to decide whether the difference between the 
#observed and expected values is significant

library(gmodels)
CrossTable(x=y_test, y=wine_pred, prop.chisq=FALSE)

