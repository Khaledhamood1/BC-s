clear all
close all
%%
k1 = 1; %how many times you want wave to oscillate in x-dir
k2 = 0; %how many times you want wave to oscillate in y-dir
[X,Y] = meshgrid(linspace(-10,10)); 
Z = 1.3*cos(k1*X).*cos(k2*Y);
figure
subplot(2,1,1)       % add first plot in 2 x 1 grid
surf(X,Y,Z); shading interp;
title('Subplot 1')
%%
R = linspace(-pi,pi); %-pi:0.01:pi; 
theta=linspace(-pi,pi);
[R, theta] = meshgrid(R, theta);
X = R.*cos(theta);     
Y = R.*sin(theta);
Z = cos(k1*X).*cos(k2*Y);
subplot(2,1,2)       % add second plot in 2 x 1 grid
surf(X,Y,Z); shading interp;       % plot using + markers
title('Subplot 2')

%%