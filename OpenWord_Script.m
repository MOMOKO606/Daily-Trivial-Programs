clear
clc
%  设定Word文件名和路径
t=now;
str=datestr(t,0);
str=[str(1:12),str(13:14),'h',str(16:17),'min',str(19:20),'s'];
filename=[pwd,'\横波分裂相关分析结果报告',32,str,'.doc'];
%  创建Microsoft Word服务器。
try
    %  若Word服务器已经打开，返回其句柄Word。
    Word=actxGetRunningServer('Word.Application');
catch
    %  创建一个Microsoft Word服务器，返回其句柄Word。
    Word=actxserver('Word.Application'); 
end

%  设置服务器界面为可见。
set(Word,'Visible',1);

% 若测试文件存在，打开该word文件，否则，新建一个文件，并保存。
if exist(filename,'file'); 
    Document=Word.Documents.Open(filename);     
else
    Document=Word.Documents.Add;     
    Document.SaveAs(filename);
end

Content=Document.Content;  %  返回Content接口句柄
Selection=Word.Selection;  %  返回Selection接口句柄

Selection.Start=Content.end;

%  绘制表格，在光标所在位置插入一个15行6列的表格，并返回句柄DTI。
DTI=Document.Tables.Add(Selection.Range,14,6);  
%  设置表格边框
DTI.Borders.OutsideLineStyle='wdLineStyleSingle';
DTI.Borders.InsideLineStyle='wdLineStyleSingle';
DTI.Rows.Item(14).Borders.Item(1).LineStyle='wdLineStyleNone';  %  将第15行的上边框线删除
DTI.Rows.Alignment='wdAlignRowCenter';  %  令表格居中
%  设置表格列宽
column_width=[53.7736,85.1434,53.7736,85.1434,53.7736,85.1434];
for i=1:6
    DTI.Columns.Item(i).Width=column_width(i);
end
%  合并单元格。
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
%  设置表格内的文字位置，大小等信息。
DTI.Range.Font.Size=10.5;
DTI.Cell(1,1).Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  第1行居中
DTI.Cell(1,1).Range.Font.Size=16;  %  三号字
DTI.Cell(1,1).Range.Font.Bold=4;  %  字体加粗

for i=3:4
    for j=1:6
        DTI.Cell(i,j).Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  3到4行字体居中
%        DTI.Cell(i,j).Range.Font.Size=10.5;  %  五号字
    end
end
%for i=1:2
 %   DTI.Cell(5,i).Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  第5行行字体居中
 %   DTI.Cell(5,i).Range.Font.Size=10.5;  %  五号字
%end
for i=10:12
    for j=1:2
        DTI.Cell(i,j).Range.Paragraphs.Alignment='wdAlignParagraphCenter';  %  第5行行字体居中
    end
end
DTI.Cell(14,1).Range.Paragraphs.Alignment='wdAlignParagraphRight';  %  第15行右对齐
%  写入表格内容。
%  表格标题部分
DTI.Cell(1,1).Range.Text='相关分析结果报告';  %  表格标题内容
%  基本信息部分
DTI.Cell(2,1).Range.Text='基本信息：';
DTI.Cell(3,1).Range.Text='台站名称';
DTI.Cell(3,2).Range.Text='MDJ';
DTI.Cell(3,3).Range.Text='台站经度';
DTI.Cell(3,4).Range.Text='128';
DTI.Cell(3,5).Range.Text='台站纬度';
DTI.Cell(3,6).Range.Text='44';
DTI.Cell(4,1).Range.Text='地震事件时间';
DTI.Cell(4,2).Range.Text='2010-5-12 23：22：14.567';
DTI.Cell(4,3).Range.Text='事件经度';
DTI.Cell(4,4).Range.Text='130';
DTI.Cell(4,5).Range.Text='事件纬度';
DTI.Cell(4,6).Range.Text='43.789';
%DTI.Cell(5,1).Range.Text='地震记录采样率';
%DTI.Cell(5,2).Range.Text='100 Hz';
DTI.Cell(5,1).Range.Text='用户输入参数：';
DTI.Cell(6,1).Range.Text='截取18到20，2秒长的波形';
DTI.Cell(7,1).Range.Text='旋转角度变化范围0°～180°，步长间隔°';
DTI.Cell(8,1).Range.Text='时间延迟变化范围-2s~2s，步长间隔0.05s';
DTI.Cell(9,1).Range.Text='计算结果：';
DTI.Cell(10,1).Range.Text='最大相关值';
DTI.Cell(10,2).Range.Text='0.987';
DTI.Cell(11,1).Range.Text='快波偏振方向';
DTI.Cell(11,2).Range.Text='67°';
DTI.Cell(12,1).Range.Text='慢波时间延迟';
DTI.Cell(12,2).Range.Text='0.1s';
t=now;
str=datestr(t,0);
DTI.Cell(14,1).Range.Text=str;
%  绘制测试图。
h=figure('Visible','off');
x=[0:0.01:2*pi];
y=sin(x);
plot(x,y);
%  将图形复制到粘贴板。
hgexport(h, '-clipboard');
%  在第14行单元格贴图。
DTI.Cell(13,1).Range.Paragraphs.Item(1).Range.Paste;


Selection.Start=Content.end;
Selection.TypeParagraph;


%  保存文档。
Document.Save;     