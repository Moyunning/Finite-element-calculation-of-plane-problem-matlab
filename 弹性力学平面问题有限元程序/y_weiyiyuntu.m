[X1,Y1,S5]=griddata(x,y,s5,linspace(0,L,(b+1)*(l+1))',linspace(0,B,(b+1)*(l+1)),'v4');
pcolor(X1,Y1,S5);
shading interp;
%'cubic'