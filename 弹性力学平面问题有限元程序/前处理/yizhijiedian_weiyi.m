function [ SU ] = yizhijiedian_weiyi( b,l,XL)
%建立已知节点位移数组
%b  划分行数
%l  划分列数
if XL==1
    SU=zeros(2*(b+1),2);
    SU(:,1)=1:2*(b+1);
elseif XL==2
    SU=zeros(2*(b+1),2);
    SU(:,1)=2*((b+1)*l+1)-1:2*(b+1)*(l+1);
elseif XL==3
    SU=zeros(2*(l+1),2);
    for i=1:(l+1)
        SU(2*i-1,1)=2*(i*(b+1))-1;
        SU(2*i,1)=2*(i*(b+1));
    end
elseif  XL==4
    SU=zeros(2*(l+1),2);
    for i=1:(l+1)
        SU(2*i-1,1)=2*((i-1)*(b+1)+1)-1;
        SU(2*i,1)=2*((i-1)*(b+1)+1);
    end
end
    
   


end

