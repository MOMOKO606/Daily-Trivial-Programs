clear
clc

%  total premium USD / year
tpu=20072.5+1684;

%  USD/HKD=7.822375 (������� 2017.07.03)
rateUH=7.822375;
%  HKD/CNH=0.8707(Alipay 2017.07.03)
rateHC=0.8707;

%  Required total premium HKD / year
tph=tpu*rateUH;
%  Required total premium CNH / year
rmb=tph*rateHC;

disp('���ʣ�2017.07.03��')
disp('USD/HKD=7.822375')
disp('HKD/CNH=0.8714')

disp(['�ܱ���(USD):',num2str(tpu),' USD'])
disp(['�ܱ���(HKD):',num2str(tph),' HKD'])
disp(['�ܱ���(HKD):',num2str(rmb),' CNH'])