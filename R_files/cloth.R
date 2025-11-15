cloth <- read.csv('C:/Users/samsc/Desktop/ADS-500B/Data_and_Code2/cloth.csv', header=TRUE, sep=',')
#having header to false gives the first row the table names and values 
#which is not what we usually want so header=true is good

#Rename all columns
colnames(cloth) <- c("rownames", "Cloth_dimension", "Number_of_flaws")
cloth

# Keep columns Cloth_dimension and Number_of_flaws, removing rownames
cloth <- subset(cloth, select = -rownames) #(-) means remove I suppose
# or select = c(Cloth_dimension, Number_of_flaws)
cloth

# Finding correlation number of flaws in cloth and its dimensions
cor(cloth$Cloth_dimension, cloth$Number_of_flaws) # 0.5846422 somewhat strong 
# correlation between number of flaws and dimensions. This means that as the number
# of dimension (size of fabric) increases, so does the number of flaws

#creating regression model to predict number of flaws in cloth to cloth dimension
ggplot(cloth,aes(x=Cloth_dimension, y=Number_of_flaws)) + geom_point() + stat_smooth(method="lm")

#determining accuracy of the cloth linear model using r^2 adj r^2 and RMSE
#(root mean squared error)
model <- lm(Cloth_dimension ~ Number_of_flaws,cloth)
summary(model)$r.squared
summary(model)$adj.r.squared
sqrt(mean((cloth$Number_of_flaws - predict(model))^2))

#the model is not very accurate