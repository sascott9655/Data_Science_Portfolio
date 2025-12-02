#softmax regression

#data is about entering high-school students and what programs they will involve
#themselves in
#outcome variable (y) is prog, which is the program type selected by student
#predictor variables (X) are social economic status "ses", a three-level 
#categorical variable, and writing score, "write", a continuous variable


hsbdemo <- read.csv('C:/Users/samsc/Desktop/ADS-500B/Data_and_Code2/hsbdemo.csv')
View(hsbdemo)
with(hsbdemo, table(ses, prog))

with(hsbdemo, do.call(rbind, tapply(write, prog, function(x) c(M=mean(x), SD=sd(x))))) #creates table of three categories of prog and shows
#the std dev and mean of the writing scores.

#there are multiple ways to do multinomial logistic regression in R
#mlogit package but to select this option we must reshape the data
#nnet package works around not having to reshape the data 
#the outcome variable is not ordinal(good,better,best). Our model
#needs to have a baseline grade
#needs to be a factor first before releveling

hsbdemo$prog <- factor(hsbdemo$prog)

hsbdemo$prog2 <- relevel(hsbdemo$prog, ref='academic')

#needs to be a factor first

library(nnet)
model1 <- multinom(prog2 ~ ses + write, data=hsbdemo)

summary(model1)

#summary shows coefficients and std errors. With coefficients the first row is comparing prog=general and prog=academic our baseline.
#second row does the same except with prog=vocation instead of prog=general

#let coefficients of the first row be b1(b10 for intercept, b11 for seslow, b12 for sesmedium, and b13 for write)
#let coefficients of the second row be b2(b20 for intercept, b21 for seslow, b22 for sesmedium, and 23 for write)
#These values will be used to compute log odds, which compares these values with baseline academic model

#ln(P(prog2=general/P(prog=academic))) = b10 + b11(ses=2) + b12(ses=3) + b13(write) and 
#ln(P(prog2=vocation/P(prog=academic))) = b20 + b21(ses=2) + b22(ses=3) + b23(write)

#log odds example: we can find out that a one-unit increase in the variable "write" is associated with the decrease in the log odds
#of being in general program vs academic program of -0.057

#relative risk -> ratio of the probability of choosing any outcome category other than baseline over baseline

exp(coef(model1))



#------------------------------------Adding knn to this------------------------

set.seed(1)

train_test_split <- sample(2, nrow(hsbdemo), replace=TRUE, prob=c(0.67,0.33))

hsbdemo.train <- hsbdemo[train_test_split==1, 7:10]
hsbdemo.test <- hsbdemo[train_test_split==2, 7:10]

#for knn using prog or prog2 works either way
hsbdemo.trainLabels <- hsbdemo[train_test_split==1,15] #using prog2
hsbdemo.testLabels <- hsbdemo[train_test_split==2,15] #prog2

library(class)

hsbdemo_pred <- knn(train=hsbdemo.train, test=hsbdemo.test, cl=hsbdemo.trainLabels, k=5)

summary(hsbdemo_pred)

library(gmodels)
CrossTable(x=hsbdemo_pred, y=hsbdemo.testLabels, prop.chisq = FALSE)




#Not as accurate as the iris dataset








#Credit to Shah 2020 for code. I go through material to learn it.