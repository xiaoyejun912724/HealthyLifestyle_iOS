# -*- coding:utf-8 -*-

import urllib
import urllib.request
import urllib.error
import random
import time
import sys
import re

class Acupoint:
    listURL = 'http://www.a-hospital.com/w/'
    detailURL = 'http://www.a-hospital.com/w/%E9%92%88%E7%81%B8%E5%AD%A6/'
    removeTags = re.compile('<.*?>|\[.*?\]|（.*?）')
    removeSpaces = re.compile('\s')
    replaceSemicolons = re.compile(';')
    
    def __init__(self):
        pass

    def getListURL(self, meridian):
        return self.listURL + urllib.parse.quote(meridian)
    
    def getDetailURL(self, acupoint):
        return self.detailURL + urllib.parse.quote(acupoint)
    
    #获取页面
    def getPage(self, url, proxy):
        # 添加代理
        proxy_handler = urllib.request.ProxyHandler({'http':proxy});
        proxy_auth_handler = urllib.request.ProxyBasicAuthHandler();
        opener = urllib.request.build_opener(proxy_handler, proxy_auth_handler);
        # 添加头信息
        opener.addheaders = [('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36')]
#        opener.addheaders = {'User-Agent':'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36',
#                             'Accept':'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
#                             'Accept-Language':'zh-CN,zh;q=0.8,en;q=0.6',
#                             'Connection':'keep-alive',
#                             'Host':'www.a-hospital.com'}
        try:
#            time.sleep(1)
            # 数据请求
            response = opener.open(url);
            return response.read().decode('utf-8')
        except urllib.error.URLError as e:
            code = ''
            reason = ''
            if hasattr(e, 'code'):
                code = e.code
            if hasattr(e, 'reason'):
                reason = e.reason
            print('连接网页失败，网址：', url, ' ', '错误原因：', code, ' ', reason)
            return None

    #获取穴位列表
    def getAcupointList(self, page):
        reg = r'<table class="wikitable">(.*?)</table>'
        pattern = re.compile(reg, re.S)
        items = re.findall(pattern, page)
        
        newitems = []
        reg = r'<tr>\n<td>(.*?)</td>\n<td>(.*?)</td>\n<td>(.*?)</td>\n<td>(.*?)</td>\n</tr>'
        pattern = re.compile(reg, re.S)
        for item in items:
            list = re.findall(pattern, item)
            for a in list:
                newitem = []
                for i in a:
                    i = re.sub(self.removeTags, "", i)
                    i = re.sub(self.removeSpaces, "", i)
                    newitem.append(i)
                newitems.append(newitem)
        return newitems

    #获取穴位详情
    def getAcupointDetail(self, page):
        reg = r'</table>\n<p>(.*)?</p>*\n<table id="toc" class="toc">'
        pattern = re.compile(reg, re.S)
        items = re.findall(pattern, page)
        detail = ''
        for item in items:
            item = re.sub(self.removeTags, "", item)
            item = re.sub(self.removeSpaces, "", item)
            item = re.sub(self.replaceSemicolons, "；", item)
            detail += item
        return detail

    #获取定位
    def getPosition(self, detail):
        reg = r'［定位］([^［]*)'
        pattern = re.compile(reg, re.S)
        items = re.findall(pattern, detail)
        detail = ''
        for item in items:
            item = re.sub(self.removeTags, "", item)
            item = re.sub(self.removeSpaces, "", item)
            item = re.sub(self.replaceSemicolons, "；", item)
            detail += item
        return detail

    #获取主治
    def getIndication(self, detail):
        reg = r'［主治］([^［]*)'
        pattern = re.compile(reg, re.S)
        items = re.findall(pattern, detail)
        detail = ''
        for item in items:
            item = re.sub(self.removeTags, "", item)
            item = re.sub(self.removeSpaces, "", item)
            item = re.sub(self.replaceSemicolons, "；", item)
            detail += item
        return detail

    #获取针灸法
    def getAcupuncture(self, detail):
        reg = r'［刺灸法］([^［]*)'
        pattern = re.compile(reg, re.S)
        items = re.findall(pattern, detail)
        detail = ''
        for item in items:
            item = re.sub(self.removeTags, "", item)
            item = re.sub(self.removeSpaces, "", item)
            item = re.sub(self.replaceSemicolons, "；", item)
            detail += item
        return detail

    #获取配伍
    def getCooperation(self, detail):
        reg = r'［配伍］([^［]*)'
        pattern = re.compile(reg, re.S)
        items = re.findall(pattern, detail)
        detail = ''
        for item in items:
            item = re.sub(self.removeTags, "", item)
            item = re.sub(self.removeSpaces, "", item)
            item = re.sub(self.replaceSemicolons, "；", item)
            detail += item
        return detail


#acupoint = Acupoint()
#page = acupoint.getPage(acupoint.listurl + "手太阳小肠经穴")
#items = acupoint.getAcupointList(page)
#for item in items:
#    print(item)
#page = acupoint.getPage(acupoint.getDetailURL("少商穴"))
#detail = acupoint.getAcupointDetail(page)
#print(detail)
#indication = acupoint.getIndication(detail)
#print(indication)
#acupuncture = acupoint.getAcupuncture(detail)
#print(acupuncture)
#cooperation = acupoint.getCooperation(detail)
#print(cooperation)


