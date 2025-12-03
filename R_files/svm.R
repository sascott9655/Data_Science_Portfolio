data <- read.csv('C:/Users/samsc/Desktop/ADS-500B/Data_and_Code2/OA 9.11 - regression.csv', header=T, sep=',')
plot(data, pch=16)

model <- lm(y ~ x, data)
abline(model)

#re-plot the original data points
plot(data, pch=16)
predictedY <- predict(model,data)
#display predictions
points(data$x, predictedY, col='blue', pch=4)

#calculating how many errors the model makes, which is accomplished using RMSE.

rmse <- function(error)
{
  sqrt(mean(error^2))
}
error <- model$residuals #same as data$Y - predictedY
lrPredictionRMSE <- rmse(error)
print(lrPredictionRMSE) #5.70 RMSE score

library(e1071)
model2 <- svm(y ~ x, data)
predictedY <- predict(model2, data)
points(data$x, predictedY, col='red', pch=4)

#rmse of the svm
error <- data$y-predictedY
svmPredictionRMSE <- rmse(error)
print(svmPredictionRMSE) #3.15 is a lower RMSE score so SVectors are better than linear regression in this case
