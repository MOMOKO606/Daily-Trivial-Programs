clear
clc
%  ��SEED�ļ���
fid=fopen('q.seed');
%  ��Volume Index Control Header��
%  ��blockette[10]��
str=textscan(fid,'%15s',1,'delimiter','');
n=blklength(str);  %  �õ�blockette[10]�ĳ��ȡ�
blk10=textscan(fid,n,1,'delimiter','/n');
%  ��blockette[11]��
str=textscan(fid,'%7s',1,'delimiter','');
n=blklength(str);  %  �õ�blockette[11]�ĳ��ȡ�
blk11=textscan(fid,n,1,'delimiter','');
nsta=char(blk11{1,1}(1,1));  %  nsta:number of stations
nsta=str2num(nsta(1:3));  %  ��ȡSEED�д洢��̨վ��Ŀ
%  ��blockette[12]��
str=textscan(fid,'%7s',1,'delimiter','');
n=blklength(str);  %  �õ�blockette[12]�ĳ��ȡ�
blk12=textscan(fid,n,1,'delimiter','');
%  ��Abbreviation Dictionary Control Header��
AbbHeader=textscan(fid,'%4090s',1,'delimiter','');
%  ��Station Control Headers��
%  ��blockette[50]��
str=textscan(fid,'%15s',1,'delimiter','');
n=blklength(str);  %  �õ�blockette[50]�ĳ��ȡ�
blk50=textscan(fid,n,1,'delimiter','');
%  ��blockette[50]�ж�ȡ����
str=char(blk50{1,1}(1,1));
x=strfind(str,'~');  %  SEED�ļ�ͷ�г���Ϊ�����Ĳ�����~��β��xΪblk50������~��λ�á�
KSTNM=str(1:5);  %  Station Name.
STLA=str(6:15);  %  Station latitude (degrees, north positive).
STLO=str(16:26);  %  Station longitude (degrees, east positive).
nchan=str2num(str(34:37));  %  nchan:number of channels.
endian=str(x(1)+8:x(1)+9);  %  01Ϊlittle endian��10Ϊbig endian
KNETWK=str(end-1:end);       %  Name of seismic network.


%  ��blockette[52]��
str=textscan(fid,'%7s',1,'delimiter','');
n=blklength(str);  %  �õ�blockette[52]�ĳ��ȡ�
blk52=textscan(fid,n,1,'delimiter','');
%  ��blockette[52]�ж�ȡ����
str=char(blk52{1,1}(1,1));
x=strfind(str,'~');
channel=str(3:5);
azimuth=str(x(1)+40:x(1)+44);
sps=str(x(1)+56:x(1)+65);






