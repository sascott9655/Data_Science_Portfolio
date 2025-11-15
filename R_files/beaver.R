beaver = read.csv('C:/Users/samsc/Desktop/ADS-500B/Data_and_Code2/beaver.csv', header=T, sep=',')
#beaver

#beaver data set:
#measurement of long-term body temperature in beavers, recorded every 10 minutes
#by telemetry

#Definition of telemetry: 
#Telemetry is the automatic collection and transmission of data from remote
#sources to monitor and analyze performance, with uses ranging from IT systems
#and aerospace to medicine and agriculture. Its purpose is to gain insights into
#the internal workings of systems or environments from a distance, allowing for
#informed decision-making, performance optimization, and the proactive detection
#of issues. Benefits include the ability to monitor dangerous or inaccessible
#environments and to improve products and services by understanding how they are
#used. (Google gemini)

beaver <- subset(beaver, select = -rownames)
beaver

#day, time, temp and activ (activity; meaning if they are outside the retreat)

X_beaver <- beaver[,c("day","time","temp")]
y_beaver <- beaver[,c("activ")]

library(caret)
set.seed(1)
inTrain <- createDataPartition(y=y_beaver, p=0.75, list=FALSE)

X_train <- X_beaver[inTrain,]
X_test <- X_beaver[-inTrain,]
y_train <- y_beaver[inTrain]
y_test <- y_beaver[-inTrain]

library(class)
beaver_pred <- knn(train=X_train,test=X_test,cl=y_train,k=5)

#using simple accuracy to predict accuracy of classifier

mean(beaver_pred == y_test)


library(gmodels)
CrossTable(x=y_test,y=beaver_pred,prop.chisq=FALSE)

#the accuracy of the model is 100% which doesn't seem right

#scatterplot of temperature recorded and day/timing of recording
library(ggplot2)
ggplot(beaver, aes(temp, time, color=activ)) + geom_point()

#graph shows that the beavers are more likely to be activ or outside when
#temperatures rise

set.seed(1)
beaverCluster <- kmeans(beaver[,1:3], 2, nstart=20)
beaverCluster

table(beaverCluster$cluster, beaver$activ)

ggplot(beaver, aes(time,temp,day, color=beaverCluster$cluster)) + geom_point()
