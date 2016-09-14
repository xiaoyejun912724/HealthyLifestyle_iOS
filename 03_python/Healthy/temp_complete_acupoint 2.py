#5. 补全穴位数据

import sqlite3
import urllib
import random
import bs4
import Acupoint

print('running insert_acupoint.py')

acupoint = Acupoint.Acupoint()
path = "../04_database/temp.db"
connect = sqlite3.connect(path)
cursor = connect.cursor()

start = 140
while True:
    sql = 'SELECT "id", "url", "description" FROM "acupoint" limit ' + str(start) + ', 20'
    cursor.execute(sql)
    result = cursor.fetchall()
    if len(result) == 0:
        break
    for row in result:
        if row[2] is None or len(row[2]) == 0:
            # 获取穴位详细信息
            page = acupoint.getPage(row[1])
            if page == None:
                break
            detail = acupoint.getAcupointDetail(page)
            position = acupoint.getPosition(detail)
            indication = acupoint.getIndication(detail)
            acupuncture = acupoint.getAcupuncture(detail)
            cooperation = acupoint.getCooperation(detail)
            dict = {'position':position, 'indication':indication, 'acupuncture':acupuncture, 'cooperation':cooperation, 'description':detail}
            insertSQL = 'UPDATE "acupoint" SET "position" = \'' + dict['position'] + '\', "indication" = \'' + dict['indication'] + '\', "acupuncture" = \'' + dict['acupuncture'] + '\', "cooperation" = \'' + dict['cooperation'] + '\', "description" = \'' + dict['description'] + '\' WHERE "id" = \'' + str(row[0]) + '\''
            print(insertSQL)
            connect.execute(insertSQL)
            connect.commit()
    start += 20
connect.close()

