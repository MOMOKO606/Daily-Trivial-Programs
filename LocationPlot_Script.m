clear
clc
%  测试临时赋值：
slong=142.1845;
slati=27.0957;
elong=140.0056;
elati=26.9442;
t=4;
t1=t/40;
t2=0.00738;  %  测得时间延迟
deg=60;  %  测得偏振角度


reptdata1=[slong;slati;elong;elati;t1;t;deg];


%  计算台站地震位置分布图的坐标范围。
[xmin,xmax,ymin,ymax]=Boundary(slong,slati,elong,elati);
%  计算图例、所测时间延迟的长度及位置等参数。
lgdx1=xmin+(xmax-xmin)*0.75;  %  图例x坐标起始点
lgdx2=xmin+(xmax-xmin)*0.9;  %  图例x坐标终止点
lgdy1=ymin+(ymax-ymin)*0.15;  %  图例y坐标起始点
lgdy2=lgdy1+(ymax-ymin)*0.01;  %  图例y坐标终止点
lgd_length=(lgdx2-lgdx1);  %  图例时间延迟长度
ep_length=(t2*lgd_length)/t1;  %  所测时间延迟长度（ep：event point）
d=(180-deg)*pi/180;  %  角度转换
epx1=elong+0.5*ep_length*sin(d);  %  所测时间延迟x坐标起点
epx2=elong-0.5*ep_length*sin(d);  %  所测时间延迟x坐标终点
epy1=elati-0.5*ep_length*cos(d);  %  所测时间延迟y坐标起点
epy2=elati+0.5*ep_length*cos(d);  %  所测时间延迟y坐标终点
%  画图
%  画出台站位置，用红色实心三角表示，并显示台站名称。
plot(slong,slati,'r^','MarkerFaceColor','Red');
title('S波分裂结果空间分布图');
xlabel('Longitude(deg.)','FontSize',12);
ylabel('Latitude(deg.)','FontSize',12);
hold on;
text(slong,slati,'MDJ','VerticalAlignment','top');
%  画出地震位置，用蓝色实心小圆表示，蓝线表示时间延迟的方向及大小。
plot(elong,elati,'o','MarkerFaceColor','Blue','MarkerSize',4);
plot([epx1,epx2],[epy1,epy2]);
%  在图右下角绘制图例。
plot([lgdx1,lgdx2],[lgdy1,lgdy1],'b',[lgdx1,lgdx1],[lgdy1,lgdy2],'b',...
     [lgdx2,lgdx2],[lgdy1,lgdy2],'b');
text((lgdx1+lgdx2)/2,lgdy1,[num2str(t1),'s'],'VerticalAlignment','top',...
     'HorizontalAlignment','center');
%  修改坐标轴范围。
axis([xmin xmax ymin ymax]);


