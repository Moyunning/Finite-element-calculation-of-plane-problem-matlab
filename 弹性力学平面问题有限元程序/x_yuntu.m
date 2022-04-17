[X1,Y1,S1]=griddata(x,y,s1,linspace(0,L,(b+1)*(l+1))',linspace(0,B,(b+1)*(l+1)),'v4');
pcolor(X1,Y1,S1);
shading interp;
%'cubic'