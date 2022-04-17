function [ ELPQ ] = zaihe_shuzu( q,b,l ,XL,AN)
%建立外载荷数组
%q   均布载荷
%b   划分行数
%l   划分列数
%XL  载荷位置
%AN  载荷与x轴所成角度
if XL==2
   ELPQ=zeros(b,5);
   for i=1:b
      ELPQ(i,1)=(b+1)*l+i;
      ELPQ(i,2)=(b+1)*l+i+1;
      ELPQ(i,3)=q;
      ELPQ(i,4)=q;
      ELPQ(i,5)=AN;
   end
elseif XL==1
    ELPQ=zeros(b,5);
    for i=1:b
        ELPQ(i,1)=i;
        ELPQ(i,2)=i+1;
        ELPQ(i,3)=q;
        ELPQ(i,4)=q;
        ELPQ(i,5)=AN;
    end
elseif XL==3
    ELPQ=zeros(l,5);
    for i=1:l
        ELPQ(i,1)=i*(b+1);
        ELPQ(i,2)=i*(b+1)+b+1;
        ELPQ(i,3)=q;
        ELPQ(i,4)=q;
        ELPQ(i,5)=AN;
    end
elseif XL==4
    ELPQ=zeros(l,5);
     for i=1:l
        ELPQ(i,1)=(i-1)*(b+1)+1;
        ELPQ(i,2)=(i-1)*(b+1)+1+b+1;
        ELPQ(i,3)=q;
        ELPQ(i,4)=q;
        ELPQ(i,5)=AN;
     end
end

