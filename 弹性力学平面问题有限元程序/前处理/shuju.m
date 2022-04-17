function [c]=shuju()
format short g
s=inputdlg({'杨氏模量E/MPa','泊松比u_','x方向比重','y方向比重','厚度t/cm','宽度B/cm','长度L/cm','载荷集度q/MPa','划分的行数b','划分的列数l',...
    '问题类型：平面应力0/平面应变1','固定端位置/Xlift(1),Xright(2),Yup(3).Ydown(4)','外载荷位置/Xlift(1),Xright(2),Yup(3).Ydown(4)','载荷与X轴所成角度/°'}, '请输入平板数据',...
    [1 60],{'210000','0.3','0','0','1','5','10','0.1','25','50','0','1','2','0'});
c=[str2double(s{1}) str2double(s{2}) str2double(s{3}) str2double(s{4}) str2double(s{5}) str2double(s{6}) str2double(s{7}) str2double(s{8}) str2double(s{9}) str2double(s{10}) str2double(s{11}) str2double(s{12}) str2double(s{13}) str2double(s{14})];
end
%  E      c(1)
%  mu     c(2)
%  wx     c(3)
%  wy     c(4)
%  t      c(5)
%  B      c(6)
%  L      c(7)
%  q      c(8)
%  b      c(9)
%  l      c(10)
%  类型   c(11)
%约束位置  c(12)
%外载荷位置 c(13)
%载荷与X轴所成角度 c(14)