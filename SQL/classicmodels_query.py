import pymysql
import mysql.connector

connection = pymysql.connect(host='localhost', user='root', password='*********', db='classicmodels', charset='utf8mb4')
conn = connection.cursor()
sql = "SELECT phone, jobTitle FROM offices JOIN employees on offices.officeCode = employees.officeCode WHERE jobTitle LIKE '%President%';"
output = conn.execute(sql)
while True:
    row = conn.fetchone()
    if row == None:
        break
    print(row)

connection.close()

