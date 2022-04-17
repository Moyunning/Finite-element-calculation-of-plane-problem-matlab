function [ DS ] = danyuan_yingli( XY,ELT,UV,EMUTW )
%DS  单元应力数组
%XY  节点坐标数组
%ELT 单元定义数组
%UV   节点位移数组
%EMUTW  材料特征数组
[M,m]=size(ELT);
DS=zeros(M,6);
for k=1:M
    ii=ELT(k,2);
    jj=ELT(k,3);
    mm=ELT(k,4);
    uv=[UV(2*ii-1),UV(2*ii),UV(2*jj-1),UV(2*jj),UV(2*mm-1),UV(2*mm)]';
    xye=[XY(ii,2),XY(ii,3);XY(jj,2),XY(jj,3);XY(mm,2),XY(mm,3)];
    xyh=[1,XY(ii,2),XY(ii,3);1,XY(jj,2),XY(jj,3);1,XY(mm,2),XY(mm,3)];
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
    ltb=ELT(k,5);
    e=EMUTW(ltb,1);
    mu=EMUTW(ltb,2);
    t1=e/2/A/(1-mu^2);
    v=(1-mu)/2;
    si=t1*[b(1),mu*c(1);mu*b(1),c(1);v*c(1),v*b(1)];
    sj=t1*[b(2),mu*c(2);mu*b(2),c(2);v*c(2),v*b(2)];
    sm=t1*[b(3),mu*c(3);mu*b(3),c(3);v*c(3),v*b(3)];
    s=[si,sj,sm];
    sxyt=s*uv;
    sx=sxyt(1);
    sy=sxyt(2);
    txy=sxyt(3);
    smn(1)=0.5*(sx+sy)+sqrt((sx-sy)^2/4+txy^2);
    smn(2)=0.5*(sx+sy)-sqrt((sx-sy)^2/4+txy^2);
    smn(3)=90-57.296*atan(txy/(sy-smn(2)));
    sxymn=[sxyt',smn];
    DS(k,:)=sxymn;
end
st=1:M;
DS=[st',DS];
    


end

