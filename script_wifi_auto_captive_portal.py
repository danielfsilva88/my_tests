import urllib, urllib2
import re

data = {"buttonClicked":"0",
"redirect_url":"",
"err_flag":"0",
"user":"labprodam@gmail.com",
"password":"labprodam2017",
"cmd":"authenticate",
"mac":"38:b1:db:cd:5d:35",
"essid":"WiFi_PRODAM",
"ip":"10.65.6.108",
"appname":"A_PRODAM_BF_01AND_B"}

encData = urllib.urlencode(data)
r = urllib2.Request("http://securelogin.arubanetworks.com/cgi-bin/login", encData)
c = urllib2.urlopen(r)
contents = c.read()
c.close()