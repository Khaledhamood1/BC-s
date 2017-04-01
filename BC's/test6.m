clear all
%close all

%%
d=2; % 2d or 3d that is
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
    z=1:nz;
else
    z=1;
end
%z=1:nz;

%dr=20;
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
ifaceW = 5.0;
d1=1;
for i=1:length(x)
    for j=1:length(y)
        for k=1:length(z)
           % rho(i,j,k)= rhol;
            dx2=(x(i)-dx)^2;
            dy2=(y(j)-dy)^2;
            
            if d==3
                dz2=(z(k)-dz)^2;
            else
                dz2=0;
            end
                
            %dz2=(z(k)-dz)^2;
            
            radius(i,j,k)= sqrt(dx2+dy2);
            a=4;
            b=2;
            e=sqrt(1-(b/a));
            c=dy+20;
            % theta=real(acos((dy^2-y(j)*dy)/(radius*(b-dy))));
            theta=atan((a*(y(j)))/(b*(x(i))));
            theta=atan((b/a)*tan(theta));
            
%             x0=a*sin(theta(i,j,k));
%             y0=b*cos(theta(i,j,k));
%             R0(i,j,k)=sqrt((x0)^2+(y0)^2);
%            numerator = a*b;
%             denomenator=sqrt(a^2*sin(theta)*sin(theta)+b^2*cos(theta)*cos(theta));
%             R0(i,j,k)= numerator/denomenator;

            R0(i,j,k)=abs(a*(1-e)-e*(x(i)-c));
            %tmp=0.5*20*(1+tanh((radius-R0)/(ifaceW*2)));
            %tmp = 0.5 *( (rhoh + rhol) - drop * (rhoh - rhol) * tanh ((radius(i,j,k) -R0(i,j,k)) / ifaceW * 2.0) );
            %tmp=  0.5*h*(1+tanh(((x(i).^2+y(i).^2)- 3)/(d1)));
            
%              if tmp>R0
%                 rho(i,j,k)=tmp;
%              else
%                  rho(i,j,k)=0.76
%             end
            if radius(i,j,k)<R0(i,j,k)
                rho(i,j,k)=2.56;
            else
                rho(i,j,k)=0.76;
            end



        end
    end
    
end

if d == 3
    xslice =[1,64];
yslice=[1,64];
zslice=1;

slice (x,y,z,rho,xslice,yslice,zslice) 
colormap winter
else 
    %figure(2)
    [X,Y] = meshgrid(x,y);
    contourf(X(:,:),Y(:,:),rho)
    colormap winter
    %fprintf('fix this\n')
end 
% xslice =[1,64];
% yslice=[1,64];
% zslice=128/2;
% 
% slice (x,y,z,rho,xslice,yslice,zslice) 
% colormap winter
