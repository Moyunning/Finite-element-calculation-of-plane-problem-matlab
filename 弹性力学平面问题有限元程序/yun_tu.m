function [picture] =yun_tu( JS,XY )
%绘制节点应力云图
%JS   节点应力矩阵
%XY   节点坐标矩阵
%ELT  单元定义数组
[a,b]=size(XY);
for i=1:a
    x=XY(i,2);
    y=XY(i,3);
    s=sqrt(JS(i,5)^2+JS(i,6)^2);
    fill(x,y,s,'FaceColor','interp');
end
shading interp;

hold off;

axis equal
    


end

