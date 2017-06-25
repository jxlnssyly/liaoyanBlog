#coding:utf-8
import urllib2
from bs4 import BeautifulSoup
import psycopg2
import datetime

headers = {'User-Agent':'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.6) Gecko/20091201 Firefox/3.5.6'}

conn = psycopg2.connect(database="blog_production", user="postgres", password="abc123", host="127.0.0.1", port="5432")
cur = conn.cursor()

def downLoad():
    for i in range(1,151):
        url = 'http://www.dbmeinv.com/dbgroup/show.htm?cid=6&pager_offset=' + str(i)
        request = urllib2.Request(url,headers=headers)
        response = urllib2.urlopen(request)
        soup = BeautifulSoup(response.read())
        for img in soup.select('.height_min'):
            attr = img.attrs

            cur.execute("INSERT INTO drivers(src, title,created_at,updated_at)VALUES(%s, %s,%s,%s)", (attr['src'], attr['title'],datetime.datetime.now(),datetime.datetime.now()
))
        conn.commit()

downLoad()
cur.close()
conn.close()
