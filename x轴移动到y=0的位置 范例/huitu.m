clear
clc
%  脚本文件说明
%  演示了将plot绘图的x轴移动到y=0的位置

%  基本plot绘图
a=textread('N7-mag.dat');
t=a(1:430,1);
x=a(1:430,2);
y=a(1:430,3);
plot(x,y);
ylabel('Za/nT');

%  修改x轴位置
%  获取参数
pos=get(gca,'Position');  %  获取坐标轴位置
xt=get(gca,'XTick');      %  获取x轴标度
xlength=xlim;             %  获取x轴范围(xlim是一个自带函数)
%  删除旧坐标系不要的内容
set(gca,'XTick',[],'XColor','w');  % 删除当前坐标系x轴的标度，x轴线颜色改为白色
%  创建新坐标系并设置
a2=axes('Position',pos+[0,pos(4)/2,0,-pos(4)/2]);  %  创建一个坐标系并调整位置
xlim(xlength);  %  设置新坐标系的x轴范围
set(gca,'XTick',xt,'Color','None','YTick',[]);  %  设置新坐标系x轴标度，删除y轴标度
xlabel('Latitude');
