function [ kz,R ] =yue_shu( kz,R,SU )
%用化1置0法将引入已知节点位移
%kz  整体刚度矩阵
%R   载荷列阵
%SU  已知节点位移数组
[b,m]=size(SU);
for i=1:b
    
       kk=SU(i,1);
       uv=SU(i,2);
       R(kk)=uv;
       kz(kk,:)=0;
       kz(:,kk)=0;
       kz(kk,kk)=1;

     
end

