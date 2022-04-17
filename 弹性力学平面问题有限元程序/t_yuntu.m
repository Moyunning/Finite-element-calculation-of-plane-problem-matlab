[X3,Y3,S3]=griddata(x,y,s3,linspace(0,L,(b+1)*(l+1))',linspace(0,B,(b+1)*(l+1)),'cubic');
pcolor(X3,Y3,S3);
shading interp;