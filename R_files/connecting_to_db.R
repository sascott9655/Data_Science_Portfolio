##install.packages("RMySQL")
library(RMySQL)
##mydb= dbConnect(MySQL(), user='root', password='*********', dbname='world', host='localhost')
##dbListTables(mydb)
##rs= dbSendQuery(mydb, "SELECT * FROM City WHERE population > 7000000")
##data=fetch(rs, n=-1) #n specifies how many records we want to extract

connection = dbConnect(MySQL(), user='root', password='*********', dbname='classicmodels', host='localhost')
dbListTables(connection)

query = dbSendQuery(connection, "SELECT e1.employeeNumber, e1.firstName, e1.lastName, e1.jobTitle from employees e1 where e1.reportsTo = (select e2.employeeNumber from employees e2 where e2.jobTitle like '%President%');")

result = fetch(query, n=-1) #store the result

View(result) #see it

dbDisconnect(connection) #close connection 