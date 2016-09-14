#5. 补全穴位数据

import sqlite3
import urllib
import random
import bs4
import Acupoint
import re

print('running insert_acupoint.py')

acupoint = Acupoint.Acupoint()
path_temp = "../04_database/temp.db"
path = "../04_database/Acupoint.db"
connect_temp = sqlite3.connect(path_temp)
connect = sqlite3.connect(path)
cursor_temp = connect_temp.cursor()

start = 0
while True:
    sql = 'SELECT "meridian_id", "name", "code", "pinyin", "position", "indication", "acupuncture", "cooperation" FROM "acupoint" limit ' + str(start) + ', 20'
    cursor_temp.execute(sql)
    result = cursor_temp.fetchall()
    if len(result) == 0:
        break
    for row in result:
        pinyin = re.sub("'", "''", row[3])
        position = re.sub("'", "''", row[4])
        indication = re.sub("'", "''", row[5])
        acupuncture = re.sub("'", "''", row[6])
        cooperation = re.sub("'", "''", row[7])
        insertSQL = 'INSERT INTO "Acupoint" ("meridian_id", "code", "pinyin", "cn_name", "cn_position", "cn_indication", "cn_cooperation", "cn_acupuncture") VALUES (\'' + str(row[0]) + '\', \'' + row[2] + '\', \'' + pinyin + '\', \'' + row[1] + '\', \'' + position + '\', \'' + indication + '\', \'' + cooperation + '\', \'' + acupuncture + '\')'
        print(insertSQL)
        connect.execute(insertSQL)
        connect.commit()
    start += 20
connect.close()
connect_temp.close()
