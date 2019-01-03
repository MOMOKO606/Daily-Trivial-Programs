clear
clc
%  �趨Word�ļ�����·��
t=now;
str=datestr(t,0);
str=[str(1:12),str(13:14),'h',str(16:17),'min',str(19:20),'s'];
filename=[pwd,'\�Შ������ط����������',32,str,'.doc'];
%  ����Microsoft Word��������
try
    %  ��Word�������Ѿ��򿪣���������Word��
    Word=actxGetRunningServer('Word.Application');
catch
    %  ����һ��Microsoft Word����������������Word��
    Word=actxserver('Word.Application'); 
end

%  ���÷���������Ϊ�ɼ���
set(Word,'Visible',1);

% �������ļ����ڣ��򿪸�word�ļ��������½�һ���ļ��������档
if exist(filename,'file'); 
    Document=Word.Documents.Open(filename);     
else
    Document=Word.Documents.Add;     
    Document.SaveAs(filename);
end

Content=Document.Content;  %  ����Content�ӿھ��
Selection=Word.Selection;  %  ����Selection�ӿھ��

Selection.Start=Content.end;

%  ���Ʊ���ڹ������λ�ò���һ��15��6�еı�񣬲����ؾ��DTI��
DTI=Document.Tables.Add(Selection.Range,14,6);  
%  ���ñ��߿�
DTI.Borders.OutsideLineStyle='wdLineStyleSingle';
DTI.Borders.InsideLineStyle='wdLineStyleSingle';
DTI.Rows.Item(14).Borders.Item(1).LineStyle='wdLineStyleNone';  %  ����15�е��ϱ߿���ɾ��
DTI.Rows.Alignment='wdAlignRowCenter';  %  �������
%  ���ñ���п�
column_width=[53.7736,85.1434,53.7736,85.1434,53.7736,85.1434];
for i=1:6
    DTI.Columns.Item(i).Width=column_width(i);
end
%  �ϲ���Ԫ��
DTI.Cell(1,1).Merge(DTI.Cell(1,6));
DTI.Cell(2,1).Merge(DTI.Cell(2,6));
%DTI.Cell(5,1).Merge(DTI.Cell(5,3));
%DTI.Cell(5,2).Merge(DTI.Cell(5,4));
for i=5:9
    DTI.Cell(i,1).Merge(DTI.Cell(i,6));
end
for i=10:12
    DTI.Cell(i,1).Merge(DTI.Cell(i,3));
    DTI.Cell(i,2).Merge(DTI.Cell(i,4));
end
DTI.Cell(13,1).Merge(DTI.Cell(13,6));
DTI.Cell(14,1).Merge(DTI.Cell(14,6));
%  ���ñ���ڵ�����λ�ã���С����Ϣ��
DTI.Range.Font.Size=10.5;
DTI.Cell(1,1).Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  ��1�о���
DTI.Cell(1,1).Range.Font.Size=16;  %  ������
DTI.Cell(1,1).Range.Font.Bold=4;  %  ����Ӵ�

for i=3:4
    for j=1:6
        DTI.Cell(i,j).Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  3��4���������
%        DTI.Cell(i,j).Range.Font.Size=10.5;  %  �����
    end
end
%for i=1:2
 %   DTI.Cell(5,i).Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  ��5�����������
 %   DTI.Cell(5,i).Range.Font.Size=10.5;  %  �����
%end
for i=10:12
    for j=1:2
        DTI.Cell(i,j).Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  ��5�����������
    end
end
DTI.Cell(14,1).Range.Paragraphs.Alignment='wdAlignParagraphRight';  %  ��15���Ҷ���
%  д�������ݡ�
%  �����ⲿ��
DTI.Cell(1,1).Range.Text='��ط����������';  %  ����������
%  ������Ϣ����
DTI.Cell(2,1).Range.Text='������Ϣ��';
DTI.Cell(3,1).Range.Text='̨վ����';
DTI.Cell(3,2).Range.Text='MDJ';
DTI.Cell(3,3).Range.Text='̨վ����';
DTI.Cell(3,4).Range.Text='128';
DTI.Cell(3,5).Range.Text='̨վγ��';
DTI.Cell(3,6).Range.Text='44';
DTI.Cell(4,1).Range.Text='�����¼�ʱ��';
DTI.Cell(4,2).Range.Text='2010-5-12 23��22��14.567';
DTI.Cell(4,3).Range.Text='�¼�����';
DTI.Cell(4,4).Range.Text='130';
DTI.Cell(4,5).Range.Text='�¼�γ��';
DTI.Cell(4,6).Range.Text='43.789';
%DTI.Cell(5,1).Range.Text='�����¼������';
%DTI.Cell(5,2).Range.Text='100 Hz';
DTI.Cell(5,1).Range.Text='�û����������';
DTI.Cell(6,1).Range.Text='��ȡ18��20��2�볤�Ĳ���';
DTI.Cell(7,1).Range.Text='��ת�Ƕȱ仯��Χ0�㡫180�㣬���������';
DTI.Cell(8,1).Range.Text='ʱ���ӳٱ仯��Χ-2s~2s���������0.05s';
DTI.Cell(9,1).Range.Text='��������';
DTI.Cell(10,1).Range.Text='������ֵ';
DTI.Cell(10,2).Range.Text='0.987';
DTI.Cell(11,1).Range.Text='�첨ƫ����';
DTI.Cell(11,2).Range.Text='67��';
DTI.Cell(12,1).Range.Text='����ʱ���ӳ�';
DTI.Cell(12,2).Range.Text='0.1s';
t=now;
str=datestr(t,0);
DTI.Cell(14,1).Range.Text=str;
%  ���Ʋ���ͼ��
h=figure('Visible','off');
x=[0:0.01:2*pi];
y=sin(x);
plot(x,y);
%  ��ͼ�θ��Ƶ�ճ���塣
hgexport(h, '-clipboard');
%  �ڵ�14�е�Ԫ����ͼ��
DTI.Cell(13,1).Range.Paragraphs.Item(1).Range.Paste;


Selection.Start=Content.end;
Selection.TypeParagraph;


%  �����ĵ���
Document.Save;     