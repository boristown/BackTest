import pymssql
import datetime
import mypsw
import csv
import glob

step = 2

print(datetime.datetime.now(), "连接中……")

conn = pymssql.connect(
    host=mypsw.host, 
    user=mypsw.user,
    password=mypsw.password,
    database=mypsw.database)

print(datetime.datetime.now(), "读取数据中……")

cursor = conn.cursor()

if step == 1:
    cursor.execute(
        "SELECT " \
        " [ID] ,[Symbol], [Date],[Close] " \
        " from [Investingcom]" \
        " order by [Symbol] asc, [Date] desc"
    )
elif step == 2:
    cursor.execute(
        "SELECT " \
        " [ID] " \
        " from [Investingcom]" \
        " where [Price001] is not null"
    )

records = cursor.fetchall()
records_count = len(records)

if step == 1:
    price_count = 120
    current_row_index = 0

    for row in records:
        price_list = []
        for price_index in range(price_count):
            last_row_index = current_row_index + price_index
            if last_row_index >= records_count:
                break
            if records[last_row_index][1] == row[1]:
                price_list.append(records[last_row_index][3])
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
                update_statement = "UPDATE [Investingcom] SET "
                for price_index in range(price_count):
                    if price_index > 0:
                        update_statement += ","
                    update_statement += " [Price" + str(price_index+1).zfill(3) + "] = " + str(price_list[price_index])
                update_statement += " WHERE [ID] = '" + str(row[0]) +"'"
                update_statement += " AND [Symbol] = '" + row[1] +"'"
                #update_statement += " AND [Date] = '" + str(row[2]) +"'"
                cursor.execute(update_statement)
                conn.commit()
                print(row[1] + ":" +str(current_row_index) + "/" + str(records_count) + "["+ str(current_row_index * 100.0 / records_count) + "%]")
        current_row_index += 1

    #    print(datetime.datetime.now(), row)
elif step == 2:
    predict_files = glob.glob("G:\Robot\BackTest\predict\*\*.csv")
    row_index = 1
    
    for predict_file in predict_files:
        print(predict_file)
        with open(predict_file,"r") as fcsv:
            csvreader = csv.reader(fcsv)
            row_index -= 1
            for csv_row in csvreader:
                row_id = records[row_index][0]
                update_statement = "UPDATE [Investingcom] SET Predict01 = " + str(csv_row[1]) + \
                ",Predict02 = " + str(csv_row[3]) + \
                ",Predict03 = " + str(csv_row[5]) + \
                ",Predict04 = " + str(csv_row[7]) + \
                ",Predict05 = " + str(csv_row[9]) + \
                ",Predict06 = " + str(csv_row[11]) + \
                ",Predict07 = " + str(csv_row[13]) + \
                ",Predict08 = " + str(csv_row[15]) + \
                ",Predict09 = " + str(csv_row[17]) + \
                ",Predict10 = " + str(csv_row[19]) + \
                " WHERE [ID] = '" + str(row_id) +"'"
                cursor.execute(update_statement)
                conn.commit()
                row_index += 1
                print(str(row_index) + "/" + str(records_count) + "["+ str(row_index * 100.0 / records_count) + "%]")

print(datetime.datetime.now(), "读取到", len(records), "条记录:")