clear all
close all
k1 = 1; %how many times you want wave to oscillate in x-dir
k2 = 0; %how many times you want wave to oscillate in y-dir
R = -pi:0.01:100;%-pi:0.01:pi; 
theta=linspace(-pi,pi);
[R, theta] = meshgrid(R, theta);
X = R.*cos(theta);     
Y = R.*sin(theta);
Z = cos(k1*X/25).*cos(k2*Y/25);

%subplot(2,1,2)          % add second plot in 2 x 1 grid
surf(X,Y,Z); shading interp;       % plot using + markers
%title('Subplot 2')
