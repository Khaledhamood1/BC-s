clear all
close all

%%
d=3; % 2d or 3d that is
nx =128;
ny=128;

if d ==3
    nz=128;
else
    nz=0;
end

h = 13; % height of the pixel in micrometer


x=1:1:nx;
y=1:ny;
if d ==3
    z=1:nz
else
    z=1
end
%z=1:nz;

dr=20;
dx=128/2;  % centre of droplet in x dir
dy=128/2;  % centre of droplet in y dir
if d == 3
    dz=128/2; % centre of droplet in the z direction
else
    dz =0
end
drop =1;
rhoh = 2.65;
rhol = 0.076;
ifaceW = 3.0;
d1=1;
for i=1:length(x)
    for j=1:length(y)
        for k=1:length(z)
            rho(i,j,k)= rhol;
            dx2=(x(i)-dx)^2;
            dy2=(y(j)-dy)^2;
            
            if d==3
                dz2=(z(k)-dz)^2;
            else
                dz2=0;
            end
                
            %dz2=(z(k)-dz)^2;
            
            radius(i,j,k) = sqrt(dx2+dy2+dz2);
            %tmp = 0.5 *( (rhoh + rhol) - drop * (rhoh - rhol) * tanh ((radius(i,j,k) - dr) / ifaceW * 2.0) );
            %tmp=  0.5*h*(1+tanh(((x(i).^2+y(i).^2)- 3)/(d1)));
            
            
            if radius(i,j,k)<dr
                rho(i,j,k)=rhoh;
            end
        end
    end
    
end

if d == 3
    xslice =[1,64];
yslice=[1,64];
zslice=128/2;

slice (x,y,z,rho,xslice,yslice,zslice) 
colormap winter
else 
    [X,Y] = meshgrid(x,y);
    contourf(X,Y,rho)
    colormap winter
    fprintf('fix this\n')
end 
% xslice =[1,64];
% yslice=[1,64];
% zslice=128/2;
% 
% slice (x,y,z,rho,xslice,yslice,zslice) 
% colormap winter
