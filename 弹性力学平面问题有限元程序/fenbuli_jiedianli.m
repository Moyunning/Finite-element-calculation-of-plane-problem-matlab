function [ R ] = fenbuli_jiedianli( XY,ELPQ,rw )
%ELPQ(b,5)   载荷数组
%XY（（b+1）*（l+1），3）  节点坐标数组
R=rw;
[b,m]=size(ELPQ);
for i=1:b
    ii=ELPQ(i,1);
    jj=ELPQ(i,2);
    lx=XY(ii,2)-XY(jj,2);
    ly=XY(ii,3)-XY(jj,3);
    l=sqrt(lx^2+ly^2);
    af=ELPQ(i,5);
    af=af*pi/180;
    qi=ELPQ(i,3);
    qj=ELPQ(i,4);
    qix=qi*cos(af);
    qiy=qi*sin(af);
    qjx=qj*cos(af);
    qjy=qj*sin(af);
    rix=qix*l/3+qjx*l/6;
    riy=qiy*l/3+qjy*l/6;
    rjx=qix*l/6+qjx*l/3;
    rjy=qiy*l/6+qjy*l/3;
    R(2*ii-1)=R(2*ii-1)+rix;
    R(2*ii)=R(2*ii)+riy;
    R(2*jj-1)=R(2*jj-1)+rjx;
    R(2*jj)=R(2*jj)+rjy;
end


end

