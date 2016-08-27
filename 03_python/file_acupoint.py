#!/usr/local/bin/python3

import sqlite3
import urllib
import random
import bs4
import Acupoint

print('running file_acupoint.py')

acupoint = Acupoint.Acupoint()

file_list = open('../04_database/acupoint_list_url.txt')
f = open('../04_database/acupoint_url.txt', 'w')
lines = file_list.readlines()
for dict in lines:
    dict = eval(dict)
    page = acupoint.getPage(dict['url'])
    if page == None:
        f.write('页面无法打开：' + url + '\n')
    list = acupoint.getAcupointList(page)
    for l in list:
        url = acupoint.getDetailURL(l[1] + '穴')
        data = {'meridian_id':dict['id'], 'meridian_name':dict['cn_name'], 'cn_name':l[1] + '穴', 'url':url, 'opened':0, 'error':0}
        f.write(str(data) + '\n')
file_list.close()
f.close()
