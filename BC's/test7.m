clear all
close all
x=-50:50;
y=-50:50;
dx=0;
dy=0;
k=1;

for i=1:length(x)
    for j=1:length(y)
        dx2=(x(i)-dx)^2;
        dy2=(y(j)-dy-20)^2;
        radius(i,j)= sqrt(dx2+dy2);
        a=1;
        b=.2;
        e=sqrt(1-(b/a));
        c=dy+20;
        theta=atan((a*(y(j)))/(b*(x(i))));
       % theta=atan((b/a)*tan(theta));
        R0(i,j)=abs(a*(1-e)-e*(x(i)-c));
        if radius(i,j)<R0(i,j)
                rho(i,j)=2.56;
        else
                rho(i,j)=0.76;
        end
    end
end

[X,Y] = meshgrid(x,y);
    contourf(X,Y,rho)
    colormap winter