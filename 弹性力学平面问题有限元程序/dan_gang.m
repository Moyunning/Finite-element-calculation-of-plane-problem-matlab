function  [ke]=dan_gang(xye,e,t,mu)
%形成单元刚度矩阵
%ke（6，6）单元刚度矩阵
%xye（3，2）单元节点坐标
%e  弹性模量
%t  单元厚度
%mu 泊松比
r=1;s=1;
kii=krst(xye,e,t,mu,r,s);
r=1;s=2;
kij=krst(xye,e,t,mu,r,s);
r=1;s=3;
kim=krst(xye,e,t,mu,r,s);
r=2;s=1;
kji=krst(xye,e,t,mu,r,s);
r=2;s=2;
kjj=krst(xye,e,t,mu,r,s);
r=2;s=3;
kjm=krst(xye,e,t,mu,r,s);
r=3;s=1;
kmi=krst(xye,e,t,mu,r,s);
r=3;s=2;
kmj=krst(xye,e,t,mu,r,s);
r=3;s=3;
kmm=krst(xye,e,t,mu,r,s);
ke=[kii,kij,kim;kji,kjj,kjm;kmi,kmj,kmm]


end

