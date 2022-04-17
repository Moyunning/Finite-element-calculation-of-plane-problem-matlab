function [ rw ] = bi_zhong( XY,ELT,EMUTW )
%将重力转化为节点载荷
%XY(N,4)节点坐标数组
%ELT（MT，5）单元定义数组
%EMUTW（LTB,5）材料特征数组
[n,m]=size(XY);
n=2*n;
rw(1:n,1:1)=0;
[MT,m]=size(ELT);
for i=1:MT
    ii=ELT(i,2);
    jj=ELT(i,3);
    mm=ELT(i,4);
    xyh=[1,XY(ii,2),XY(ii,3);1,XY(jj,2),XY(jj,3);1,XY(mm,2),XY(mm,3)];
    A=0.5*det(xyh);
    A=abs(A);
    LTB=ELT(i,5);
    t=EMUTW(LTB,3);
    wx=EMUTW(LTB,4);
    wy=EMUTW(LTB,5);
    rw(2*ii-1)=rw(2*ii-1)+A*t*wx/3;
    rw(2*ii)=rw(2*ii)+A*t*wy/3;
    rw(2*jj-1)=rw(2*jj-1)+A*t*wx/3;
    rw(2*jj)=rw(2*jj)+A*t*wy/3;
    rw(2*mm-1)=rw(2*mm-1)+A*t*wx/3;
    rw(2*mm)=rw(2*mm)+A*t*wy/3;
end
end

