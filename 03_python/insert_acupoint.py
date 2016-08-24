#!/usr/local/bin/python3

import sqlite3
import Acupoint

path = "../04_database/Acupoint.db"
connect = sqlite3.connect(path)

sql = 'SELECT "cnname" FROM "Meridian"'
cursor = connect.execute(sql)
acupoint = Acupoint.Acupoint()
for row in cursor:
    url = acupoint.getListURL(row[0] + '穴')
    page = acupoint.getPage(url)
    list = acupoint.getAcupointList(page)
    for l in list:
        url = acupoint.getDetailURL(l[1] + '穴')
        page = acupoint.getPage(url)
        detail = acupoint.getAcupointDetail(page)
        indication = acupoint.getIndication(detail)
        acupuncture = acupoint.getAcupuncture(detail)
        cooperation = acupoint.getCooperation(detail)
        break
    break;

connect.close();
