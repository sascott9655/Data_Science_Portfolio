#clustering is a common technique for dealing with unsupervised learning.
#Unsupervised learning is when the training 
#data is unlabeled so it is not able to be 
#properly categorized. We do not have a way to know which data point should go
#to which class. Instead we are interested in characterizing and explaining the
#data. Such a process is exploratory in nature (Shah, 2020)

#using the datasets library
library(datasets)
head(iris)

#scatterplot
library(ggplot2)
ggplot(iris, aes(Petal.Length, Petal.Width, color= Species)) + geom_point()

#clustering using the kmeans function. I assume this clusters the means
#of k neighbors based on iris type. 3 neighbors. only doing petal.width and 
#species name with [,3:4] column indexing.

set.seed(20)
irisCluster <- kmeans(iris[,3:4], 3, nstart=20)
irisCluster

#gives summary of clusters generated. We can visualized clusters using a table

table(irisCluster$cluster, iris$Species)

#creating scatterplot with clusters
ggplot(iris, aes(Petal.Length, Petal.Width, color=irisCluster$cluster)) + geom_point() 