#!/usr/local/bin/python3

import sqlite3

path = "../04_database/Acupoint.db"
connect = sqlite3.connect(path)

sql = 'SELECT "cnname" FROM "Meridian"'
cursor = connect.execute(sql)
for row in cursor:
    row[0]

connect.close();
