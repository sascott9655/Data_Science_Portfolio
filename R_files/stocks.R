stock <- read.csv(file.choose(), header=TRUE, sep=",")
plot(stock$Average.stock.price..in.USD.,type = "o", col= "red",xlab = "Hours of operation", ylab = "Average stock price")
