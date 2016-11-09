#1. 创建正式数据库

import sqlite3

path = "../04_database/Acupoint.db"
connect = sqlite3.connect(path)
print("open database success")

#position       位置
#indication     主治
#cooperation    配伍
#acupuncture    针灸法
sql =   'CREATE TABLE IF NOT EXISTS "Acupoint" (' +\
            '"id" INTEGER PRIMARY KEY AUTOINCREMENT, ' +\
            '"meridian_id" INTEGER DEFAULT 0, ' +\
            '"function_id" INTEGER DEFAULT 0, ' +\
            '"code" VARCHAR(16), ' +\
            '"pinyin" VARCHAR(64), ' +\
            '"cn_name" VARCHAR(64), ' +\
            '"position" TEXT, ' +\
            '"cn_position" TEXT, ' +\
            '"indication" TEXT, ' +\
            '"cn_indication" TEXT, ' +\
            '"compatibility" TEXT, ' +\
            '"cn_compatibility" TEXT, ' +\
            '"acupuncture" TEXT, ' +\
            '"cn_acupuncture" TEXT' +\
        ')'
connect.execute(sql);

sql = 'CREATE TABLE IF NOT EXISTS "Meridian" ("id" INTEGER PRIMARY KEY AUTOINCREMENT, "name" VARCHAR(64), "cn_name" VARCHAR(64), "indication" TEXT, "cn_indication" TEXT)'
connect.execute(sql);

sql = 'CREATE TABLE IF NOT EXISTS "Function" ("id" INTEGER PRIMARY KEY AUTOINCREMENT, "name" VARCHAR(64), "cn_name" VARCHAR(64))'
connect.execute(sql);

sql = 'CREATE TABLE IF NOT EXISTS `Position` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` VARCHAR(64), `cn_name` VARCHAR(64))'
connect.execute(sql);

print("create table success")

connect.close();

