#!/usr/local/bin/python3

import sqlite3
import Acupoint

print('running insert_acupoint.py')

path = "../04_database/Acupoint.db"
connect = sqlite3.connect(path)

sql = 'SELECT "id", "cnname" FROM "Meridian"'
cursor = connect.execute(sql)
acupoint = Acupoint.Acupoint()
for row in cursor:
    url = acupoint.getListURL(row[1] + '穴')
    print(url)
    page = acupoint.getPage(url)
    list = acupoint.getAcupointList(page)
    for l in list:
        url = acupoint.getDetailURL(l[1] + '穴')
        print(url)
        page = acupoint.getPage(url)
        if page:
            detail = acupoint.getAcupointDetail(page)
            position = acupoint.getPosition(detail)
            indication = acupoint.getIndication(detail)
            acupuncture = acupoint.getAcupuncture(detail)
            cooperation = acupoint.getCooperation(detail)
            dict = {"merdian_id":str(row[0]), "code":l[0], "cnname":l[1] + '穴', "pinyin":l[2], "position":position, "indication":indication, "acupuncture":acupuncture, "cooperation":cooperation}
            print(dict)
#        insertSQL = 'INSERT INTO "Acupoint" ("merdian_id", "code", "cnname", "pinyin", "position", "indication", "acupuncture", "cooperation") VALUES ("' + dict["merdian_id"] + '", "' + dict["code"] + '", "' + dict["cnname"] + '", "' + dict["pinyin"] + '", "' + dict["position"] + '", "' + dict["indication"] + '", "' + dict["acupuncture"] + '", "' + dict["cooperation"] + '")'
#        connect.execute(sql)
#connect.commit()
print("insert table Acupoint success")

connect.close()
