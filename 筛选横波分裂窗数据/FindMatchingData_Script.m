%  ���ܣ�����'�׶�Ą̇վ��Ϣ.dat'��Ĳ�����ɸѡ'�׶�Ȧ���������б�.dat'�е����ݣ�
%        �����ϺᲨ���Ѵ������ݣ��Լ���Ӧ̨վ�ȴ���output2�С�
clear
clc

fid=fopen('�׶�Ȧ���������б�.dat');
event=textscan(fid,'%f %f %d %f');
fclose(fid);
n=length(event{1,1});

fid=fopen('�׶�Ą̇վ��Ϣ.dat');
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
        slo=STLO*pi/180;  %  ̨վ���ȣ�ת��Ϊ���ȣ�
        sla=LatiTrans(STLA);  %  ̨վ������γ��
        elo=EVLO*pi/180;  %  ���о��ȣ�ת��Ϊ���ȣ�
        ela=LatiTrans(EVLA);  %  ���е�����γ��
        %  �������оࡣ
        t=acos(cos(ela)*cos(sla)+sin(ela)*sin(sla)*cos(elo-slo));
        dist=t*180*111.12/pi; %  ��λΪǧ��
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
        
     
        
        
        
         
        