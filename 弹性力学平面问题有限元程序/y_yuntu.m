[X2,Y2,S2]=griddata(x,y,s2,linspace(0,L,(b+1)*(l+1))',linspace(0,B,(b+1)*(l+1)),'v4');
pcolor(X2,Y2,S2);
shading interp;