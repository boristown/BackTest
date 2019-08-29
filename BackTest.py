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

cursor.execute(
    "SELECT " \
    " [ID] ,[Symbol], [Date],[Close] " \
    " from [Investingcom]" \
    " order by [Symbol] asc, [Date] desc"
)

records = cursor.fetchall()

price_count = 120
current_row_index = 0

for row in records:
    price_list = []
    for price_index in range(price_count):
        last_row_index = current_row_index + price_index
        if row[last_row_index][1] == row[current_row_index][1]:
            price_list.append(row[last_row_index][3])
        else:
            break
    if len(price_list) == price_count:
        max_price = max(price_list)
        min_price = min(price_list)
        center_price = (max_price + min_price) / 2
        range_price = max_price - min_price
        if range_price > 0:
            for price_index in range(price_count):
                price_list[price_index] -= center_price
                price_list[price_index] /= range_price
                price_list[price_index] += 0.5
                if price_list[price_index] > 0.99999:
                    price_list[price_index] = 1.0
                elif price_list[price_index] < 0.00001:
                    price_list[price_index] = 0.0

    current_row_index += 1

#    print(datetime.datetime.now(), row)

print(datetime.datetime.now(), "读取到", len(records), "条记录:")