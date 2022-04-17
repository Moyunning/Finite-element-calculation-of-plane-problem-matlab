function [krs]= krst(xye,e,t,mu,r,s)
%建立单元刚度子矩阵
%xye（3，2）：单元节点坐标数组
%e：弹性模量
%mu：泊松比
%t:单元厚度
xyh=[1,xye(1,1),xye(1,2);1,xye(2,1),xye(2,2);1,xye(3,1),xye(3,2)];
A=0.5*det(xyh);
A=abs(A);
b(1:3)=0;
c(1:3)=0;
for i=1:3
    if i==1
        j=2;
        m=3;
    elseif i==2
        j=3;
        m=1;
    else
        j=1;
        m=2;
    end
    b(i)=xye(j,2)-xye(m,2);
    c(i)=xye(m,1)-xye(j,1);
end
v=(1-mu)/2;
etmu=e*t/4/(1-mu^2)/A;
krs=etmu*[b(r)*b(s)+v*c(r)*c(s),mu*b(r)*c(s)+v*c(r)*b(s);...
    mu*c(r)*b(s)+v*b(r)*c(s),c(r)*c(s)+v*b(r)*b(s)];
end

