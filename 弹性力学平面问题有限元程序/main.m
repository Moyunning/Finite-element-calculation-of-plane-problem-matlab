indate;
if XEV==1
    [LTB,m]=size(EMUTW);
    for i=1:LTB
        E=EMUTW(i,1);
        MU=EMUTW(i,2);
        EMUTW(i,1)=E/(1-MU^2);
        EMUTW(i,2)=1/(1-MU);
    end
end
[kz]=zong_gang(XY,ELT,EMUTW);
[r]=bi_zhong(XY,ELT,EMUTW);
[R]=fenbuli_jiedianli(XY,ELPQ,r);
[kz,R]=yue_shu(kz,R,SU);
[UV]=lzy_gs(kz,R);
[DS]=danyuan_yingli( XY,ELT,UV,EMUTW );
[JS]=jiedian_yingli( ELT,DS,XY,c(9),c(10) );
[a,b]=size(XY);
[p,q]=size(ELT);
x=XY(:,2);
y=XY(:,3);
s1=JS(:,2);
s2=JS(:,3);
s3=JS(:,4);
s4=zeros(a,1);
s5=zeros(a,1);
for i=1:2*a
    if mod(i,2)~=0
        s4((i+1)/2,1)=UV(i,1);
    else 
        s5(i/2,1)=UV(i,1);
    end
end
b=c(9);
l=c(10);
B=c(6);
L=c(7);
x_yuntu;
title('X-应力云图：');
figure
y_yuntu;
title('Y-应力云图：');
figure
t_yuntu;
title('T-应力云图：');
figure
x_weiyiyuntu;
title('X-位移云图：');
figure
y_weiyiyuntu;
title('Y-位移云图：');


