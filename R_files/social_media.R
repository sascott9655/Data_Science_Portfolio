#logistic regression using social media user data

social_media <- read.csv('C:/Users/samsc/Desktop/ADS-500B/Data_and_Code2/social_media_users/Social_Network_Ads.csv', header=TRUE, sep=',')

View(social_media)

#(400 row entries by 5 total columns)
#Columns:
#User.ID - unique values columns which has wont be used for trends or correlations
#Gender - male or female categorical data
#Age - continous data
#Estimated Salary - discrete data
#Purchased - predictor variable and it is binary (0 is no and 1 is yes)

#Find NA values in the data using sapply() if any

sapply(social_media, function(a) sum(is.na(a)))

#No NA values
 
#-------------------------------------------------------------------------------

#Subset data for important data trends

social_media <- subset(social_media, select=c(2,3,4,5)) #remove Id column
#because it shows no relation to predicting if product is purchased

#test to see if categorical columns are factors because that is how R deals with
#using logistic regression is to have 

is.factor(social_media$Gender) #FALSE
is.factor(social_media$Purchased) #FALSE

categorical_cols <- c("Gender", "Purchased")
social_media[categorical_cols] <- lapply(social_media[categorical_cols], as.factor)

is.factor(social_media$Gender) #TRUE
is.factor(social_media$Purchased) #TRUE

#-------------------------------------------------------------------------------
#Training-testing split 75/25. 

train <- social_media[1:300,]
test <- social_media[301:400,]

model <- glm(Purchased~., family=binomial(link='logit'), data=train)
summary(model)

#how good is our model

fitted.results <- predict(model,newdata=subset(test, select =c(1,2,3)),type='response')
fitted.results <- ifelse(fitted.results > 0.5, 1, 0)
misClasificError <- mean(fitted.results != test$Purchased)
print(paste(1-misClasificError))

#76% percent is alright

#-------------------------------------------------------------------------------

#using ROC for perhaps better storytelling on how good the model is

library(ROCR)
p <- predict(model,newdata=subset(test, select=c(1,2,3)),type='response')
pr <- prediction(p, test$Purchased)
prf <- performance(pr, measure='tpr', x.measure ='fpr')
plot(prf)

auc <- performance(pr,measure='auc')

auc <- auc@y.values[[1]]
auc
