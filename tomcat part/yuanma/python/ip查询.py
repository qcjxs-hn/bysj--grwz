import urllib.request

url ='http://www.7k7k.comm'
pr = urllib.request.ProxyHandler({'http':'183.222.101.103'})
opener = urllib.request.build_opener(pr)

#opener.add_handler = [('Uesr-Agent','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:73.0) Gecko/20100101 Firefox/73.0')]
urllib.request.install_opener(opener)

response =urllib.request.urlopen(url)
html = response.read().decode('utf-8')


print(html)
