function [ F,X,Y ] = lattice_cart(rr1,rr2,cl,N)
%UNTITLED2 summary
% Detailed explanation goes here
r1=rr1/cl; % where to start in x axis
r2=rr2/cl; % where to end in x axis
d1= 5; 
h= 1.3;  % height of the defect
R = linspace(r1,r2,N); % discretize space
R0 = 2.5;   % this is where the slope changes from increase to decrease
theta = linspace(0,2*pi,N); % discretise the polar coordinate
[R, theta] = meshgrid(R,theta); 
X = R.*cos(theta);     % from polar to cart
Y = R.*sin(theta);     % from polar to cart
F = 0.5*h*(1+tanh(((X.^2+Y.^2)- R0)/(d1)));
end

