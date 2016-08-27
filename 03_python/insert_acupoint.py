#!/usr/local/bin/python3

import sqlite3
import urllib
import random
import bs4
import Acupoint

print('running insert_acupoint.py')

acupoint = Acupoint.Acupoint()
path = "../04_database/temp.db"
connect = sqlite3.connect(path)
cursor = connect.cursor()

start = 140
while True:
    sql = 'SELECT "id", "url", "description" FROM "acupoint" limit ' + str(start) + ', 20'
    cursor.execute(sql)
    result = cursor.fetchall()
    if len(result) == 0:
        break
    for row in result:
        if row[2] is None or len(row[2]) == 0:
            # 获取穴位详细信息
            page = acupoint.getPage(row[1])
            if page == None:
                break
            detail = acupoint.getAcupointDetail(page)
            position = acupoint.getPosition(detail)
            indication = acupoint.getIndication(detail)
            acupuncture = acupoint.getAcupuncture(detail)
            cooperation = acupoint.getCooperation(detail)
            dict = {'position':position, 'indication':indication, 'acupuncture':acupuncture, 'cooperation':cooperation, 'description':detail}
            insertSQL = 'UPDATE "acupoint" SET "position" = \'' + dict['position'] + '\', "indication" = \'' + dict['indication'] + '\', "acupuncture" = \'' + dict['acupuncture'] + '\', "cooperation" = \'' + dict['cooperation'] + '\', "description" = \'' + dict['description'] + '\' WHERE "id" = \'' + str(row[0]) + '\''
            print(insertSQL)
            connect.execute(insertSQL)
            connect.commit()
    start += 20
connect.close()
#f.close()
#
#file_list = open('../04_database/acupoint_list_url.txt')
#f = open('../04_database/acupoint_url.txt', 'w')
#lines = file_list.readlines()
#for url in lines:
#    page = acupoint.getPage(url)
#    if page == None:
#        f.write('页面无法打开：' + url + '\n')
#    list = acupoint.getAcupointList(page)
#    for l in list:
#        url = acupoint.getDetailURL(l[1] + '穴')
#        f.
#file_list.close()
#f.close()

#acupoint = Acupoint.Acupoint()
#for row in cursor:
#    url = acupoint.getListURL(row[1] + '穴')
#    print(url)
#    page = acupoint.getPage(url)
#    if page == None:
#        break
#
#    list = acupoint.getAcupointList(page)
#    for l in list:
#        url = acupoint.getDetailURL(l[1] + '穴')
#        print(url)
#        page = acupoint.getPage(url)
#        if page == None:
#            f.write('页面无法打开：' + url + '\n')
#            break
#
#        detail = acupoint.getAcupointDetail(page)
#        position = acupoint.getPosition(detail)
#        indication = acupoint.getIndication(detail)
#        acupuncture = acupoint.getAcupuncture(detail)
#        cooperation = acupoint.getCooperation(detail)
#        dict = {'merdian_id':str(row[0]), 'code':l[0], 'cn_name':l[1] + '穴', 'pinyin':l[2], 'position':position, 'indication':indication, 'acupuncture':acupuncture, 'cooperation':cooperation, 'description':detail, 'url':url}
#        f.write(str(dict) + '\n')
#        insertSQL = 'INSERT INTO "Acupoint" ("merdian_id", "code", "cn_name", "pinyin", "position", "indication", "acupuncture", "cooperation", "description", "url") VALUES ("' + dict['merdian_id'] + '", "' + dict['code'] + '", "' + dict['cn_name'] + '", "' + dict['pinyin'] + '", "' + dict['position'] + '", "' + dict['indication'] + '", "' + dict['acupuncture'] + '", "' + dict['cooperation'] + '", "' + dict['description'] + '", "' + dict['url'] + '")'
#        connect.execute(insertSQL)
#        connect.commit()
#print("insert table Acupoint success")


