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
lrPredictionRMSE <- rsme(error)