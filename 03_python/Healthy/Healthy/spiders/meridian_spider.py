# -*- coding: utf-8 -*-

# Define here the models for your scraped spiders
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/spiders.html

import scrapy


class MeridianSpider(scrapy.Spider):
    name = 'meridian'
    allowed_domains = ['a-hospital.com'];
    start_urls = ['http://www.a-hospital.com/w/手太阴肺经穴',
                  'http://www.a-hospital.com/w/手厥阴心包经穴',
                  'http://www.a-hospital.com/w/手少阴心经穴',
                  'http://www.a-hospital.com/w/手阳明大肠经穴',
                  'http://www.a-hospital.com/w/手少阳三焦经穴',
                  'http://www.a-hospital.com/w/手太阳小肠经穴',
                  'http://www.a-hospital.com/w/足太阴脾经穴',
                  'http://www.a-hospital.com/w/足厥阴肝经穴',
                  'http://www.a-hospital.com/w/足少阴肾经穴',
                  'http://www.a-hospital.com/w/足阳明胃经穴',
                  'http://www.a-hospital.com/w/足少阳胆经穴',
                  'http://www.a-hospital.com/w/足太阳膀胱经穴'];

    def parse(self, response):
        filename = response.url.split('/')[-2]
        open(filename, 'wb').write(response, body)


