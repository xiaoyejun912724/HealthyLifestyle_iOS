
# -*- coding:utf-8 -*-

import urllib
import re

class Acupoint:
    def __init__(self):
        self.url = 'http://www.a-hospital.com/w/'
    
    #获取经脉下的穴位列表页面
    def getPage(self, meridian):
        url = self.url + meridian
        request = urllib.request.Request(url)
        response = urllib.request.urlopen(request)
        return response.read().decode('utf-8')

    #获取穴位信息
    def getAcupoint(self, page):
        pattern = re.compile('')