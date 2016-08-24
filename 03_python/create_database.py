#!/usr/local/bin/python3

import sqlite3

path = "../04_database/Acupoint.db"
connect = sqlite3.connect(path)
print("open database success")

sql = 'CREATE TABLE IF NOT EXISTS "Acupoint" ("id" INTEGER PRIMARY KEY AUTOINCREMENT, "merdianId" INTEGER DEFAULT 0, "functionId" INTEGER DEFAULT 0, "name" VARCHAR(64), "cnname" VARCHAR(64), "position" TEXT, "cnposition" TEXT, "attend" TEXT, "cnattend" TEXT)'
connect.execute(sql);

sql = 'CREATE TABLE IF NOT EXISTS "Function" ("id" INTEGER PRIMARY KEY AUTOINCREMENT, "name" VARCHAR(64), "cnname" VARCHAR(64))'
connect.execute(sql);

sql = 'CREATE TABLE IF NOT EXISTS "Meridian" ("id" INTEGER PRIMARY KEY AUTOINCREMENT, "name" VARCHAR(64), "cnname" VARCHAR(64), "treat" TEXT, "cntreat" TEXT)'
connect.execute(sql);

print("create table success")

connect.close();
