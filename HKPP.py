# -*- coding: utf-8 -*-
"""
Created on Sat May 12 22:15:41 2018

@author: bianl
"""
#  Hong Kong Prudential Premium
#  重疾险 Critical disease insurance
cdiusd = 1684.00
cdioff = 1645.96

#  储蓄险 Savings insurance
siusd = 20072.5 
sioff = 836.52

totalusd = (cdiusd - cdioff) + (siusd - sioff)

# HKD对CNY汇率0.8092（2018.05.14）
hcrate = 0.8092
#  USD HKD汇率固定为7.8
uhrate = 7.8

#  多加300港币保险一点
#  渣打（汇入）收取等值于100人民币的港币
totalhkd = totalusd * uhrate + 300  + 100 / hcrate


# 工行（汇出）手续费为100-200元
totalcny = totalhkd * hcrate + 200  

