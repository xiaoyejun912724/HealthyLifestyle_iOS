#4. 填入经脉数据

import sqlite3
import urllib
import Acupoint

print('running temp_insert_meridian.py')

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
