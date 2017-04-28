# encoding:utf-8
import math
import requests
import jieba
import sys
reload(sys)
sys.setdefaultencoding('utf8')

argv='/home/tiffany/词典/太空旅客.txt'
oFilePath = '/home/tiffany/词典/分词/'
filename = argv
f = open(filename,'r')
file_read = f.read()
f.close()
fen_list = jieba.cut(file_read,cut_all=True)
result = {}
for fen in fen_list:
    # sys.stdout.write(fen.encode('utf-8') + ',')
    fen = ' '.join(fen.split())
    if(fen != ''and fen != "\n" and fen != "\n\n" and fen.isdigit()!=True and len(fen)>1):
        if result.has_key(fen):
            result[fen] += 1
        else:
            result[fen] = 1


f = open(oFilePath+'统计结果.txt',"w")

L = sorted(result.items(),key=lambda asd:asd[1],reverse=True)
for keyword in L[0:5]:
    f.write(keyword[0]+' '+'出现次数：'+str(keyword[1])+'\n')
f.close()