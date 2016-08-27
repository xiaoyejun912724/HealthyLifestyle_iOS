#!/usr/local/bin/python3

import sqlite3
import urllib
import Acupoint

print('running file_acupoint_list.py')

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
