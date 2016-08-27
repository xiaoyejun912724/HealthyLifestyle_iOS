#!/usr/local/bin/python3

import sqlite3
import urllib
import random
import bs4
import Acupoint

print('running insert_acupoint.py')

path = "../04_database/Acupoint.db"
connect = sqlite3.connect(path)

sql = 'SELECT "id", "cnname" FROM "Meridian"'
cursor = connect.execute(sql)
acupoint = Acupoint.Acupoint()
f = open('../04_database/acupoint_database.txt', 'w')
for row in cursor:
    url = acupoint.getListURL(row[1] + '穴')
    print(url)
    page = acupoint.getPage(url)
    if page == None:
        break

    list = acupoint.getAcupointList(page)
    for l in list:
        url = acupoint.getDetailURL(l[1] + '穴')
        print(url)
        page = acupoint.getPage(url)
        if page == None:
            f.write('页面无法打开：' + url + '\n')
            break

        detail = acupoint.getAcupointDetail(page)
        position = acupoint.getPosition(detail)
        indication = acupoint.getIndication(detail)
        acupuncture = acupoint.getAcupuncture(detail)
        cooperation = acupoint.getCooperation(detail)
        dict = {'merdian_id':str(row[0]), 'code':l[0], 'cn_name':l[1] + '穴', 'pinyin':l[2], 'position':position, 'indication':indication, 'acupuncture':acupuncture, 'cooperation':cooperation, 'description':detail, 'url':url}
        f.write(str(dict) + '\n')
#        insertSQL = 'INSERT INTO "Acupoint" ("merdian_id", "code", "cn_name", "pinyin", "position", "indication", "acupuncture", "cooperation", "description", "url") VALUES ("' + dict['merdian_id'] + '", "' + dict['code'] + '", "' + dict['cn_name'] + '", "' + dict['pinyin'] + '", "' + dict['position'] + '", "' + dict['indication'] + '", "' + dict['acupuncture'] + '", "' + dict['cooperation'] + '", "' + dict['description'] + '", "' + dict['url'] + '")'
#        connect.execute(insertSQL)
#        connect.commit()
print("insert table Acupoint success")

connect.close()
