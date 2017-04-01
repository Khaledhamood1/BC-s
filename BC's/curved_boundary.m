clear all
close all

%% lattice properties
d=3; % 2d or 3d that is
N=170; % total number of lattices
nx =N;
ny=N;
if d ==3;
    nz=N;
else
    nz=0;
end
x=1:1:nx;
y=1:ny;
if d ==3
    z=1:nz;
else
    z=1;
end
%% Curved Boundary
lh = 5; % height of the pixel in microns
lh_l=5;  % pixel height in LU 
cl=lh/lh_l; % length conversion factor

width_peak=18.7; % width of peak in microns
width_peak_l=round(width_peak/cl); % width of the peak in lattice units


width_tanh= 6.2; % width of increasing/decreasing part of the pixel
width_tanh_l=round(width_tanh/cl);

width_mid=20; %width of middle part of the pixel
width_mid_l=round(width_mid/cl);

length_dim=20; % 214 microns length of the pixel 
N=2*width_peak_l+2*width_tanh_l+width_mid_l; % change N to minimum
nx =N;
ny=N;
if d ==3;
    nz=N;
else
    nz=0;
end
x=1:1:nx;
y=1:ny;
if d ==3
    z=1:nz;
else
    z=1;
end

%% Droplet Details
dr_d= 10;  % droplet size in 
dr=round(dr_d/cl);  % convert this
dx=N/2;  % centre of droplet in x dir
dy=N/2;  % centre of droplet in y dir
if d == 3
    dz=N/2; % centre of droplet in the z direction
else
    dz =0
end
drop =1;  % 1 for droplet -1 for bubble
rhoh = 2.65; % density of the heavy phase
rhol = 0.076; % density of the light phase
ifaceW = 3.0;   % thickness of the interface
d1=1;
%%

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
            
            if y(j)<width_peak_l & x(i)<lh_l
                rho(i,j,k)=1;
            elseif y(j)<(width_peak_l+width_tanh_l) & x(i)<-tan(25*pi/180)*(y(j)-width_peak_l)+lh_l
                if y(j)>=width_peak_l
                    rho(i,j,k)=1;
                end
                
            elseif y(j)>(width_peak_l+width_tanh_l+width_mid_l)& y(j)<=(width_peak_l+2*width_tanh_l+width_mid_l)& x(i)<tan(25*pi/180)*(y(j)-(width_peak_l+2*width_tanh_l+width_mid_l))+lh_l
               % if y(j)<=(width_peak_l+2*width_tanh_l+width_mid_l)
                    rho(i,j,k)=1;
                %end
                
            elseif y(j)>(width_peak_l+2*width_tanh_l+width_mid_l)& y(j)<=(2*width_peak_l+2*width_tanh_l+width_mid_l)& x(i)<lh_l
                    rho(i,j,k)=1;
            else
                rho(i,j,k)=rhol;
            end
            
            %tmp=  0.5*h*(1+tanh(((x(i).^2+y(i).^2)- 3)/(d1)));
            tmp = 0.5 *( (rhoh + rhol) - drop * (rhoh - rhol) * tanh ((radius(i,j,k) - dr) / ifaceW * 2.0) );
            
            if radius(i,j,k)<dr
               rho(i,j,k)=rhoh;
           end
        end
    end
    
end


%% plots
if d == 3
    xslice =[1,64];
    yslice=[1,64];
    zslice=128/2;
    
    slice (x,y,z,rho,xslice,yslice,zslice)
    colormap winter
else
    [X,Y] = meshgrid(x,y);
    contourf(X,Y,rho)
    xlabel('y')
    ylabel('x')
    colormap winter
    fprintf('fix this\n')
end
% xslice =[1,64];
% yslice=[1,64];
% zslice=128/2;
% 
% slice (x,y,z,rho,xslice,yslice,zslice) 
% colormap winter
