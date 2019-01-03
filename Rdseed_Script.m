clear
clc
%  打开SEED文件。
fid=fopen('q.seed');
%  读Volume Index Control Header。
%  读blockette[10]。
str=textscan(fid,'%15s',1,'delimiter','');
n=blklength(str);  %  得到blockette[10]的长度。
blk10=textscan(fid,n,1,'delimiter','/n');
%  读blockette[11]。
str=textscan(fid,'%7s',1,'delimiter','');
n=blklength(str);  %  得到blockette[11]的长度。
blk11=textscan(fid,n,1,'delimiter','');
nsta=char(blk11{1,1}(1,1));  %  nsta:number of stations
nsta=str2num(nsta(1:3));  %  读取SEED中存储的台站数目
%  读blockette[12]。
str=textscan(fid,'%7s',1,'delimiter','');
n=blklength(str);  %  得到blockette[12]的长度。
blk12=textscan(fid,n,1,'delimiter','');
%  读Abbreviation Dictionary Control Header。
AbbHeader=textscan(fid,'%4090s',1,'delimiter','');
%  读Station Control Headers。
%  读blockette[50]。
str=textscan(fid,'%15s',1,'delimiter','');
n=blklength(str);  %  得到blockette[50]的长度。
blk50=textscan(fid,n,1,'delimiter','');
%  从blockette[50]中读取参数
str=char(blk50{1,1}(1,1));
x=strfind(str,'~');  %  SEED文件头中长度为变量的参数以~结尾，x为blk50中所有~的位置。
KSTNM=str(1:5);  %  Station Name.
STLA=str(6:15);  %  Station latitude (degrees, north positive).
STLO=str(16:26);  %  Station longitude (degrees, east positive).
nchan=str2num(str(34:37));  %  nchan:number of channels.
endian=str(x(1)+8:x(1)+9);  %  01为little endian，10为big endian
KNETWK=str(end-1:end);       %  Name of seismic network.


%  读blockette[52]。
str=textscan(fid,'%7s',1,'delimiter','');
n=blklength(str);  %  得到blockette[52]的长度。
blk52=textscan(fid,n,1,'delimiter','');
%  从blockette[52]中读取参数
str=char(blk52{1,1}(1,1));
x=strfind(str,'~');
channel=str(3:5);
azimuth=str(x(1)+40:x(1)+44);
sps=str(x(1)+56:x(1)+65);






