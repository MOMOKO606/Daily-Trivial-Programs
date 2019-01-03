clear
clc

%  total premium USD / year
tpu=20072.5+1684;

%  USD/HKD=7.822375 (渣打香港 2017.07.03)
rateUH=7.822375;
%  HKD/CNH=0.8707(Alipay 2017.07.03)
rateHC=0.8707;

%  Required total premium HKD / year
tph=tpu*rateUH;
%  Required total premium CNH / year
rmb=tph*rateHC;

disp('汇率（2017.07.03）')
disp('USD/HKD=7.822375')
disp('HKD/CNH=0.8714')

disp(['总保费(USD):',num2str(tpu),' USD'])
disp(['总保费(HKD):',num2str(tph),' HKD'])
disp(['总保费(HKD):',num2str(rmb),' CNH'])