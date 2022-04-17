function [ XY ] = jiedian_zuobiao( B,L,b,l )
%建立节点坐标矩阵
%XY((b+1)*(l+1),3)节点坐标数组
%B模型宽度
%L模型长度
%b划分行数
%l划分列数
X0=ones(1,l);Y0=ones(1,b);
A{1,1}=num2str(Y0);A{1,2}=num2str(X0);
C=inputdlg({'请输入行间距比例：','请输入列间距比例：'},'请输入网格划分比例',[1 60],A,'on');
X=str2num(C{2});
if length(X)~=l
    X=X0;
    warning('输入的行间距数量与行数不符，已重置为默认！')
end
Y=str2num(C{1});
if length(Y)~=b
    Y=Y0;
    warning('输入的列间距数量与列数不符，已重置为默认！')
end
for i=2:l
    X(i)=X(i)+X(i-1);
end
for i=2:b
    Y(i)=Y(i)+Y(i-1);
end
X=[0,X];
Y=[0,Y];
p=B/Y(b+1);q=L/X(l+1);
XY=zeros((b+1)*(l+1),3);
for i=1:(l+1)
    for j=1:(b+1)
        m=(i-1)*(b+1)+j;
        XY(m,1)=m;
        XY(m,2)=q*X(i);
        XY(m,3)=p*Y(j);
    end
end

    
    

end

