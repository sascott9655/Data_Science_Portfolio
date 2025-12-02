print(getwd()) #getting working directory
print(setwd('C:/Users/samsc/Desktop/ADS-500B/Data_and_Code2')) #setting the working directory
print(getwd()) #checking to make sure setwd() works

regressionData <- read.csv('C:/Users/samsc/Desktop/ADS-500B/Data_and_Code2/OA 8.1 - regression.csv', header=T, sep=',')

#build a linear model
model <- lm(y~x, data=regressionData)
summary(model)

#Visualize the model
attach(regressionData)
plot(x, y, col = rgb(0.2, 0.4, 0.6, 0.4), main = "Linear regression")
abline(model, col = "red") #main=title, rgb=red,green,blue,alpha,
#x,y,color  
#abline is to add the line 

#Gradient descent:
#cost function

cost <- function(X, y, theta) {
  sum(X%*%theta - y)^2/(2*length(y))
}

#2-d vector in thetat using parameters m and b

theta <- matrix(c(0,0), nrow=2)
num_iter <- 300
alpha <- 0.01 #learning rate

#storage for errors and parameters at every iteration

cost_history <- double(num_iter)
theta_history <- list(num_iter)

#to use generalized function we want to first param theta-0 making
#x-theta-0  = 1

X <- cbind(1, matrix(x))

for(i in 1:num_iter) { #R indexes start at 1 
  error <- (X%*% theta-y)
  delta <- t (X) %*%error/length(y)
  theta <- theta - alpha * delta
  cost_history[i] <- cost(X, y, theta)
  theta_history[[i]] <- theta
}

print(theta)

#visualize gradient descent every step of the way
plot(x,y, main = "Gradient descent")
abline(coef = theta_history[[1]])
abline(coef = theta_history[[2]])
abline(coef = theta_history[[3]])
abline(coef = theta_history[[4]])
abline(coef = theta_history[[5]])

#put it in a loop

plot(x y)














#Credit to Shah (2020) for code snippet 

