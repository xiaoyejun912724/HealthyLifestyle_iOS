#!/usr/local/bin/python3

import sqlite3
import urllib
import Acupoint

print('running temp_insert_meridian.py')

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
path = "../04_database/temp.db"
connect_temp = sqlite3.connect(path)
sql = 'SELECT "id", "cnname" FROM "Meridian"'
cursor = connect.execute(sql)
for row in cursor:
    url = acupoint.getListURL(row[1] + '穴')
    dict = {'id':str(row[0]), 'name':row[1], 'url':url}
    sql = 'INSERT INTO "meridian" ("id", "name", "url") VALUES ("' + dict['id'] + '", "' + dict['name'] + '", "' + dict['url'] + '")'
    connect_temp.execute(sql)
    connect_temp.commit()
connect.close()
connect_temp.close()