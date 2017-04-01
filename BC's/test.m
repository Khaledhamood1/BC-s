clear
close all

%%
%x = 0:0.01:10;
d1=2;
h=1.3;
%R = 0:0.01:4;
R=linspace(0,4,109);
R0 = 2.5;
%theta= 0:0.001:pi;
theta = linspace(0,pi,109);
[R, theta] = meshgrid(R, theta);
X = R.*cos(theta);     
Y = R.*sin(theta);
F = 0.5*h*(1+tanh(((X.^2+Y.^2)- R0)/(d1)));
surf(X,Y,F); shading interp;
xlabel('x')
ylabel('y')
zlabel('z')
hold on
%%
xa = -R(end);
xb = R(end);
ya = 0;
yb = -50;
[X,Y] = meshgrid(linspace(xa,xb, 109),linspace(ya, yb, 109) );
% 
%r0 = sqrt(R0);
f1 = 0.5*h*(1+tanh(((X.^2)-R0)/(d1)));    % here be dragons

surf(X,Y, f1); shading interp;
%%

%R = 0:0.01:4;
R=linspace(0,4,109);
R0 = 2.5;
%theta= pi:0.001:2*pi;
theta = linspace(pi,2*pi,109);
[R, theta] = meshgrid(R, theta);
X1 = R.*cos(theta);
Y1 = yb + R.*sin(theta);
F1 = 0.5*h*(1+tanh((X1.^2+(Y1-yb).^2 - R0)/d1));
F = 0.5*h*(1+tanh(((X.^2+Y.^2)- R0)/(d1)));
surf(X1,Y1,F1); shading interp;