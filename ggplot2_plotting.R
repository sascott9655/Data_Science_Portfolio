# customer data is OA 6.1

custdata = read.table('custdata.tsv', header=T, sep='\t') 

# you can put filename
# or you can use file.choose(), which is an amazing function btw!

custdata = read.table(file.choose(), header=T, sep='\t')

library(ggplot2) #loading the ggplot package
ggplot(custdata) +geom_histogram(aes(x=age), binwidth=5, fill="blue")
ggplot(custdata) +geom_bar(aes(x=marital.stat), fill="blue")

cor(custdata$age, custdata$income) #0.027 (kind of low correlation)

#the correlation between age and income is low because they are some null
and missing values 
# let's fix that by creating a subset of the data without null values

custdata2 <- subset(custdata, (custdata$age > 0 & custdata$age < 100 & custdata$income > 0))
#subset takes ages between 0 and 100 and income greater than zero as our subset

cor(custdata2$age, custdata2$income) #-0.022 (still low correlation but different result)

