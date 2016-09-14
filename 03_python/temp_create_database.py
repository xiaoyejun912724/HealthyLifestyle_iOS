#3. 创建缓存数据库

import sqlite3
import urllib
import Acupoint

print('running temp_create_database.py')

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
            '"position" TEXT, ' +\
            '"indication" TEXT, ' +\
            '"acupuncture" TEXT, ' +\
            '"cooperation" TEXT, ' +\
            '"description" TEXT, ' +\
            '"url" TEXT)'
connect.execute(sql);
connect.close();
