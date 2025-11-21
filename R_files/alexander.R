library(RMySQL)
connection = dbConnect(MySQL(), user='root', password='!********', dbname='classicmodels',
                       host='localhost')

dbListTables(connection)

query = dbSendQuery(connection, "SELECT contactFirstName, addressLine1 FROM customers WHERE contactFirstName LIKE '%Alexander%';")
result = fetch(query, n=-1)
View(result)
dbDisconnect(connection)