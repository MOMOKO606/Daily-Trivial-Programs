clear
clc
[FileName,PathName]=uigetfile(...
{'*.SAC','SAC Files(*.SAC)';'*.*','All Files(*.*)'},...
 '选择文件');
SACfile=strcat(PathName,FileName);
[hd,stime,sdata]=rdSac(SACfile);
%  从SAC头文件中读入所需参数
delta=hd{1,1}(1,1);
STLA=hd{1,1}(32,1);    %Station latitude (degrees, north positive).
STLO=hd{1,1}(33,1);    %Station longitude (degrees, east positive).
EVLA=hd{1,1}(36,1);    %Event latitude (degrees, north positive). 
EVLO=hd{1,1}(37,1);    %Event longitude (degrees, east positive). 
ST=hd{1,1}(71:76,1);   %Time corresponding to reference (zero) time in file.
[StartData,StartTime]=SacTime(ST);
NPTS=hd{1,1}(80,1);    %Number of points per data component.
KSTNM=hd{2,1};         %Station name.
KCMPNM=hd{22,1};       %Component name.
KNETWK=hd{23,1};       %Name of seismic network.

%  定义xtick以及xticklabel
x=fix(max(stime)/60);
temp1=[0:1/delta*60:1/delta*60*x];
temp1=round(temp1+1);
xtick=stime(temp1);
for i=1:x
    temp2(i)={strcat('+',num2str(i),'m')};
end
xticklabel=[StartTime,temp2];

%  画图
DataTime=strcat(StartData,32,StartTime);
str=strcat(DataTime,32,32,32,32,32,32,KNETWK,':',KSTNM,':',KCMPNM);
axes1=axes('Parent',figure);
plot(stime,sdata,'Parent',axes1),grid on;
title(str);
box off;
set(axes1,'XLim',[min(stime) max(stime)],'XTick',xtick,'XTickLabel',xticklabel);


