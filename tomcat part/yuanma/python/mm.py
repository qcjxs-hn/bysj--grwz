# fil = open('name.txt','w')
# fil.write('就哈哈哈哈哈哈哈哈哈哈哈哈')
# fil.close()
#
#
#
#
# fi1=open('name.txt','a')
# fi1.write('\n嘻嘻嘻嘻嘻嘻嘻嘻')
# fi1.close()
#
#
# fi=open('name.txt')
# print(fi.read())
# fi.close()
fil6 =open('name.txt')
print(fil6.tell())
print(fil6.read(1))
print(fil6.tell())
fil6.seek(0)
print(fil6.tell())
print(fil6.read(5))
print(fil6.tell())