#!/usr/local/bin/python3

import sqlite3
import urllib
import Acupoint

print('running temp_acupoint_list.py')

#创建数据库
path = "../04_database/temp.db"
connect = sqlite3.connect(path)
sql = 'CREATE TABLE IF NOT EXISTS "meridian" (' +\
            '"id" INTEGER PRIMARY KEY AUTOINCREMENT, ' +\
            '"name" VARCHAR(64), ' +\
            '"url" TEXT)'
connect.execute(sql);
sql = 'CREATE TABLE IF NOT EXISTS "acupoint" (' +\
            '"id" INTEGER PRIMARY KEY AUTOINCREMENT, ' +\
            '"meridian_id" INTEGER, ' +\
            '"meridian_name" VARCHAR(64), ' +\
            '"name" VARCHAR(64), ' +\
            '"code" VARCHAR(16), ' +\
            '"pinyin" VARCHAR(64), ' +\
            '"position" TEXT' +\
            '"indication" TEXT' +\
            '"acupuncture" TEXT' +\
            '"cooperation" TEXT' +\
            '"description" TEXT' +\
            '"url" TEXT)'
connect.execute(sql);
connect.close();



acupoint = Acupoint.Acupoint()
path = "../04_database/Acupoint.db"

connect = sqlite3.connect(path)
sql = 'SELECT "id", "cnname" FROM "Meridian"'
cursor = connect.execute(sql)
f = open('../04_database/acupoint_list_url.txt', 'w')
for row in cursor:
    url = acupoint.getListURL(row[1] + '穴')
    dict= {'cn_name':row[1], 'id':row[0], 'url':url, 'opened':0}
    f.write(str(dict) + '\n')
connect.close()
f.close()
