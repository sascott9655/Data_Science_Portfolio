custdata = read.table('custdata.tsv', header=T, sep='\t') # you can put filename
# or you can use file.choose(), which is an amazing function btw!
custdata = read.table(file.choose(), header=T, sep='\t')

library(ggplot2) #loading the ggplot package
ggplot(custdata) +geom_histogram(aes(x=age), binwidth=5, fill="blue")
ggplot(custdata) +geom_bar(aes(x=marital.stat), fill="blue")