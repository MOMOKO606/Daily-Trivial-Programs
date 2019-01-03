%  功能：根据'首都圈台站信息.dat'里的参数，筛选'首都圈波形数据列表.dat'中的数据，
%        将符合横波分裂窗的数据，以及对应台站等存入output2中。
clear
clc

fid=fopen('首都圈波形数据列表.dat');
event=textscan(fid,'%f %f %d %f');
fclose(fid);
n=length(event{1,1});

fid=fopen('首都圈台站信息.dat');
station=textscan(fid,'%s %f %f','delimiter',',');
fclose(fid);
m=length(station{1,1});

output2=cell(1810,1);
k=1;
for i=1:n
    EVLO=event{1,1}(i);  %  Station longitude
    EVLA=event{1,2}(i);  %  Station latitude
    depth=event{1,3}(i);
    output1=[];
    for j=1:m
        if (depth == 0)
            break
        end
        STLO=station{1,2}(j);  %  Event longitude 
        STLA=station{1,3}(j);  %  Event latitude
        slo=STLO*pi/180;  %  台站经度（转换为弧度）
        sla=LatiTrans(STLA);  %  台站地心余纬度
        elo=EVLO*pi/180;  %  震中经度（转换为弧度）
        ela=LatiTrans(EVLA);  %  震中地心余纬度
        %  计算震中距。
        t=acos(cos(ela)*cos(sla)+sin(ela)*sin(sla)*cos(elo-slo));
        dist=t*180*111.12/pi; %  单位为千米
        if (dist <= depth)
            temp=[char(station{1,1}(j)),32,32,num2str(dist)];
            output1=strvcat(output1,temp);
        end
    end
    if (isempty(output1) == 0)
        output2(k,1)={i};
        output2(k,2)={depth};
        output2(k,3)={event{1,4}(i)};
        output2(k,4)={output1};
        k=k+1;
    end
end
        
     
        
        
        
         
        