


import urllib
import Acupoint

#url = 'http://www.a-hospital.com/w/%E9%92%88%E7%81%B8%E5%AD%A6/%E9%83%84%E9%97%A8%E7%A9%B4'
url = 'http://www.a-hospital.com/w/%E9%92%88%E7%81%B8%E5%AD%A6/%E9%97%B4%E4%BD%BF%E7%A9%B4'
acupoint = Acupoint.Acupoint()
page = acupoint.getPage(url)
if page == None:
    print('page get failed')
detail = acupoint.getAcupointDetail(page)
print(detail)
