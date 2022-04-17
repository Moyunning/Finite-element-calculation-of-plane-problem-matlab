function [x] =lzy_gs( kz,R )
%列主元高斯消去法解方程组
[n,m]=size(kz);
x=zeros(n,1);
det=1;
e=0.00000001;
for k=1:(n-1)
    for i=(k+1):n
        if abs(kz(i,k))>abs(kz(k,k))
            w=kz(k,:);
            kz(k,:)=kz(i,:);
            kz(i,:)=w;
            w=R(k);
            R(k)=R(i);
            R(i)=w;
            det=-det;
        end
    end
    for i=(k+1:n)
        t=-kz(i,k)/kz(k,k);
        kz(i,:)=kz(i,:)+kz(k,:)*t;
        R(i)=R(i)+R(k)*t;
    end
    det=det*kz(k,k);
    if abs(det)<e
        disp '矩阵奇异'
        return
    end
end
if abs(kz(n,n))<e
    disp '矩阵奇异'
    return
end
det=det*kz(n,n);
x(n,1)=R(n)/kz(n,n);
for i=(n-1):-1:1
    ax=0;
    for j=(i+1):n
        ax=ax+kz(i,j)*x(j,1);
    end
    x(i,1)=(R(i)-ax)/kz(i,i);
end
            


end

