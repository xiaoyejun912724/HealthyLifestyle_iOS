import urllib.request


values = {"username":"1016903103@qq.com","password":"XXXX"}
data = urllib.parse.urlencode(values)
url = "http://www.baidu.com"
request = urllib.request.Request(url)
response = urllib.request.urlopen(request)
print(response.read())

