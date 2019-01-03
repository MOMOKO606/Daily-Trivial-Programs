function n=blklength(str)
a=char(str{1,1}(1,1));
x=str2num(a(end-3:end))-7;
n=['%',num2str(x),'s'];