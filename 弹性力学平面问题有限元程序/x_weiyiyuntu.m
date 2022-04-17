[X1,Y1,S4]=griddata(x,y,s4,linspace(0,L,(b+1)*(l+1))',linspace(0,B,(b+1)*(l+1)),'cubic');
pcolor(X1,Y1,S4);
shading interp;
%'cubic'