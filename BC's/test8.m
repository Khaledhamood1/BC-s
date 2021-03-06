clear all
close all

% a=20;
% b=10;
% c=sqrt(a^2-b^2);
% x1=20;
% y1=0;
% x2=-20;
% y2=0;
% e=c/a;
% 
% a = 1/2*sqrt((x2-x1)^2+(y2-y1)^2);
% b = a*sqrt(1-e^2);
%  t = linspace(0,2*pi);
%  X = a*cos(t);
%  Y = b*sin(t);
%  w = atan2(y2-y1,x2-x1);
%  x = (x1+x2)/2 + X*cos(w) - Y*sin(w);
%  y = (y1+y2)/2 + X*sin(w) + Y*cos(w);
%  
%  plot(x,y,'y-')
%  axis equal
 %%
clear
x=1:128;
y=1:128;
xc1=64;
yc1=64-20;
k=1;
a=10;
b=20;
c=sqrt(a^2-b^2);
x1=10;
y1=50;
x2=20;
y2=30;
e=c/a;

for i=1:length(x)/2
    for j=1:length(y)/2
%         dx2=(x(i)-dx)^2;
%         dy2=(y(j)-dy)^2;
%         radius(i,j,k) = sqrt(dx2+dy2+dz2);
%         numerator= a^2*b^2-b^2^x(i)^2+2*b^2*x(i)*xc1^2-a^2*b^2;
%         denomenator=a^2-2*a^2*yc1;
%         y(i,j)=sqrt(abs(numerator/denomenator));
%         if radius(i,j)<R0(i,j)
%                 rho(i,j)=2.56;
%         else
%                 rho(i,j)=0.76;
%         end
        dx= (x(i)-xc1)^2/a^2;
        dy=(y(j)-yc1)^2/b^2;
        if dx+dy <= 1 
            rho(i,j)= 2.56;
        else
            rho(i,j)=0.76;
        end
        
    end
end
 xx=x(1,1:64);
 yy=y(:,1:64)
% plot(xx,yy,'y-')
%  axis equal
[X,Y] = meshgrid(xx,yy);
contourf(X,Y,rho)
colormap winter