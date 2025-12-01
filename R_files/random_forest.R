bank <- read.csv('C:/Users/samsc/Desktop/ADS-500B/Data_and_Code2/bank.csv', header=TRUE, sep=';')
View(bank)
barplot(table(bank$y))


y = c('y')
bank[y] = lapply(bank[y], as.factor)


set.seed(1234)
population <- sample(nrow(bank), 0.75 * nrow(bank))
train <- bank[population, ]
test <- bank[-population, ]

#install.packages('randomForest')
library(randomForest)
model <- randomForest(y ~ ., data=train)
model #500 trees built

prediction <- predict(model, newdata = test)
table(prediction, test$y)

(982 +33)/nrow(test)
#89.7 percent accuracy