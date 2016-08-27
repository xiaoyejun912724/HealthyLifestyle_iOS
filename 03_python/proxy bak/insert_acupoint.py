#!/usr/local/bin/python3

import sqlite3
import urllib
import random
import bs4
import Acupoint

#print('正在获取可用的代理IP')
#url = 'http://www.xicidaili.com/nn/'
#headers = {'User-Agent':'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.64 Safari/537.11'}
#request = urllib.request.Request(url, None, headers)
#response = urllib.request.urlopen(request).read()
#soup = bs4.BeautifulSoup(response)
#IPList = soup.findAll('tr')
#proxies = []
#for x in range(1, len(IPList)):
#    ip = IPList[x]
#    tds = ip.findAll('td')
#    ip_temp = 'http://' + tds[1].contents[0] + ':' + tds[2].contents[0]
#    proxies.append(ip_temp)
#url = "http://ip.chinaz.com/getip.aspx"
#usefulProxies = []
#for proxy in proxies:
#    try:
#        print(proxy)
#        proxy_handler = urllib.request.ProxyHandler({'http':proxy})
#        proxy_auth_handler = urllib.request.ProxyBasicAuthHandler()
#        opener = urllib.request.build_opener(urllib.request.HTTPHandler, proxy_handler)
#        f = opener.open(url)
#        res = f.read().decode('utf-8')
#        print('Res: ', res)
#        usefulProxies.append(proxy)
#        if len(usefulProxies) >= 5:
#            break
#    except Exception as e:
#        print('Error: ', proxy, e)
#        continue
#print('已获取可用的代理IP', usefulProxies)

usefulProxies = ['', '', '']

print('running insert_acupoint.py')

path = "../04_database/Acupoint.db"
connect = sqlite3.connect(path)

sql = 'SELECT "id", "cnname" FROM "Meridian"'
cursor = connect.execute(sql)
acupoint = Acupoint.Acupoint()
f = open('../04_database/acupoint_database.txt', 'w')
for row in cursor:
    url = acupoint.getListURL(row[1] + '穴')
    print(url)
    page = acupoint.getPage(url, usefulProxies[random.randint(0, len(usefulProxies) - 1)])
    if page == None:
        break

    list = acupoint.getAcupointList(page)
    for l in list:
        url = acupoint.getDetailURL(l[1] + '穴')
        print(url)
        page = acupoint.getPage(url, usefulProxies[random.randint(0, len(usefulProxies) - 1)])
        if page == None:
            f.write('页面无法打开：' + url + '\n')
            break

        detail = acupoint.getAcupointDetail(page)
        position = acupoint.getPosition(detail)
        indication = acupoint.getIndication(detail)
        acupuncture = acupoint.getAcupuncture(detail)
        cooperation = acupoint.getCooperation(detail)
        dict = {'merdian_id':str(row[0]), 'code':l[0], 'cn_name':l[1] + '穴', 'pinyin':l[2], 'position':position, 'indication':indication, 'acupuncture':acupuncture, 'cooperation':cooperation, 'description':detail, 'url':url}
        f.write(str(dict) + '\n')
#        insertSQL = 'INSERT INTO "Acupoint" ("merdian_id", "code", "cn_name", "pinyin", "position", "indication", "acupuncture", "cooperation", "description", "url") VALUES ("' + dict['merdian_id'] + '", "' + dict['code'] + '", "' + dict['cn_name'] + '", "' + dict['pinyin'] + '", "' + dict['position'] + '", "' + dict['indication'] + '", "' + dict['acupuncture'] + '", "' + dict['cooperation'] + '", "' + dict['description'] + '", "' + dict['url'] + '")'
#        connect.execute(insertSQL)
#connect.commit()
print("insert table Acupoint success")

connect.close()
