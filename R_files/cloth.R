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
of dimension (size of fabric) increases, so does the number of flaws