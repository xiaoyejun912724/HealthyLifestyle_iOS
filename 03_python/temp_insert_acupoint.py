#!/usr/local/bin/python3

import sqlite3
import urllib
import Acupoint

print('running temp_insert_acupoin.py')

acupoint = Acupoint.Acupoint()
path = "../04_database/temp.db"
connect = sqlite3.connect(path)
sql = 'SELECT "id", "name", "url" FROM "meridian"'
cursor = connect.execute(sql)
for row in cursor:
    page = acupoint.getPage(row[2])
    if page == None:
        continue
    list = acupoint.getAcupointList(page)
    for l in list:
        dict = {'merdian_id':str(row[0]), 'meridian_name':row[1], 'name':l[1] + '穴', 'code':l[0], 'pinyin':l[2], 'url':acupoint.getDetailURL(l[1] + '穴')}
        sql = 'INSERT INTO "acupoint" ("meridian_id", "meridian_name", "name", "code", "pinyin", "url") VALUES ("' + dict['merdian_id'] + '", "' + dict['meridian_name'] + '", "' + dict['name'] + '", "' + dict['code'] + '", "' + dict['pinyin'] + '", "' + dict['url'] + '")'
        connect.execute(sql)
        connect.commit()
connect.close()
