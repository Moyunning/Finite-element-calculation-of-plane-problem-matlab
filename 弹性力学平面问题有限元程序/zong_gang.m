function [kz]=zong_gang(XY,ELT,EMUTW)
%kz     总体刚度矩阵
%XY（N，4）节点坐标数组
%ELT（MT,5）单元定义数组
%EMUTM(LTB,5)材料特征数组
[N,m]=size(XY);
n=2*N;
kz=zeros(n);
[MT,m]=size(ELT);
for k=1:MT
    i=ELT(k,2);
    j=ELT(k,3);
    m=ELT(k,4);
    LTB=ELT(k,5);
    xye=[XY(i,2),XY(i,3);XY(j,2),XY(j,3);XY(m,2),XY(m,3)];
    e=EMUTW(LTB,1);
    mu=EMUTW(LTB,2);
    t=EMUTW(LTB,3);
    ke=dan_gang(xye,e,t,mu);
    cn=[2*i-1,2*i,2*j-1,2*j,2*m-1,2*m];
    for i=1:6
        for j=1:6
            iz=cn(i);
            jz=cn(j);
            kz(iz,jz)=kz(iz,jz)+ke(i,j);
        end
    end
end

end

