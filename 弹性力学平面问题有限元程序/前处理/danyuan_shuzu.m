function [ ELT] = danyuan_shuzu( b,l )
%建立单元特征数组
%b  划分行数
%l  划分列数
ELT=zeros(b*l,5);
for i=1:l;
    for j=1:b;
        m=(i-1)*b*2+2*j;
        n=(i-1)*b*2+2*j-1;
        ELT(n,1)=n;
        ELT(m,1)=m;
        ELT(n,2)=(i-1)*(b+1)+j;
        ELT(n,3)=(i-1)*(b+1)+j+(b+1);
        ELT(n,4)=(i-1)*(b+1)+j+1;
        ELT(m,2)=(i-1)*(b+1)+j+1;
        ELT(m,3)=(i-1)*(b+1)+j+(b+1);
        ELT(m,4)=(i-1)*(b+1)+j+(b+1)+1;
    end
end
ELT(:,5)=1;
        

end

