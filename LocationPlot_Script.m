clear
clc
%  ������ʱ��ֵ��
slong=142.1845;
slati=27.0957;
elong=140.0056;
elati=26.9442;
t=4;
t1=t/40;
t2=0.00738;  %  ���ʱ���ӳ�
deg=60;  %  ���ƫ��Ƕ�


reptdata1=[slong;slati;elong;elati;t1;t;deg];


%  ����̨վ����λ�÷ֲ�ͼ�����귶Χ��
[xmin,xmax,ymin,ymax]=Boundary(slong,slati,elong,elati);
%  ����ͼ��������ʱ���ӳٵĳ��ȼ�λ�õȲ�����
lgdx1=xmin+(xmax-xmin)*0.75;  %  ͼ��x������ʼ��
lgdx2=xmin+(xmax-xmin)*0.9;  %  ͼ��x������ֹ��
lgdy1=ymin+(ymax-ymin)*0.15;  %  ͼ��y������ʼ��
lgdy2=lgdy1+(ymax-ymin)*0.01;  %  ͼ��y������ֹ��
lgd_length=(lgdx2-lgdx1);  %  ͼ��ʱ���ӳٳ���
ep_length=(t2*lgd_length)/t1;  %  ����ʱ���ӳٳ��ȣ�ep��event point��
d=(180-deg)*pi/180;  %  �Ƕ�ת��
epx1=elong+0.5*ep_length*sin(d);  %  ����ʱ���ӳ�x�������
epx2=elong-0.5*ep_length*sin(d);  %  ����ʱ���ӳ�x�����յ�
epy1=elati-0.5*ep_length*cos(d);  %  ����ʱ���ӳ�y�������
epy2=elati+0.5*ep_length*cos(d);  %  ����ʱ���ӳ�y�����յ�
%  ��ͼ
%  ����̨վλ�ã��ú�ɫʵ�����Ǳ�ʾ������ʾ̨վ���ơ�
plot(slong,slati,'r^','MarkerFaceColor','Red');
title('S�����ѽ���ռ�ֲ�ͼ');
xlabel('Longitude(deg.)','FontSize',12);
ylabel('Latitude(deg.)','FontSize',12);
hold on;
text(slong,slati,'MDJ','VerticalAlignment','top');
%  ��������λ�ã�����ɫʵ��СԲ��ʾ�����߱�ʾʱ���ӳٵķ��򼰴�С��
plot(elong,elati,'o','MarkerFaceColor','Blue','MarkerSize',4);
plot([epx1,epx2],[epy1,epy2]);
%  ��ͼ���½ǻ���ͼ����
plot([lgdx1,lgdx2],[lgdy1,lgdy1],'b',[lgdx1,lgdx1],[lgdy1,lgdy2],'b',...
     [lgdx2,lgdx2],[lgdy1,lgdy2],'b');
text((lgdx1+lgdx2)/2,lgdy1,[num2str(t1),'s'],'VerticalAlignment','top',...
     'HorizontalAlignment','center');
%  �޸������᷶Χ��
axis([xmin xmax ymin ymax]);


