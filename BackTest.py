import pymssql
import datetime
import mypsw

print(datetime.datetime.now(), "连接中……")

conn = pymssql.connect(
    host=mypsw.host, 
    user=mypsw.user,
    password=mypsw.password,
    database=mypsw.database)

print(datetime.datetime.now(), "读取数据中……")

cursor = conn.cursor()

cursor.execute("SELECT TOP (10) [ID] ,[Symbol] from [Investingcom]")

records = cursor.fetchall()

print(datetime.datetime.now(), "读取到", len(records), "条记录:")

for row in records:
    print(datetime.datetime.now(), row)