clear
clc
%  �ű��ļ�˵��
%  ��ʾ�˽�plot��ͼ��x���ƶ���y=0��λ��

%  ����plot��ͼ
a=textread('N7-mag.dat');
t=a(1:430,1);
x=a(1:430,2);
y=a(1:430,3);
plot(x,y);
ylabel('Za/nT');

%  �޸�x��λ��
%  ��ȡ����
pos=get(gca,'Position');  %  ��ȡ������λ��
xt=get(gca,'XTick');      %  ��ȡx����
xlength=xlim;             %  ��ȡx�᷶Χ(xlim��һ���Դ�����)
%  ɾ��������ϵ��Ҫ������
set(gca,'XTick',[],'XColor','w');  % ɾ����ǰ����ϵx��ı�ȣ�x������ɫ��Ϊ��ɫ
%  ����������ϵ������
a2=axes('Position',pos+[0,pos(4)/2,0,-pos(4)/2]);  %  ����һ������ϵ������λ��
xlim(xlength);  %  ����������ϵ��x�᷶Χ
set(gca,'XTick',xt,'Color','None','YTick',[]);  %  ����������ϵx���ȣ�ɾ��y����
xlabel('Latitude');
