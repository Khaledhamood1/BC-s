close all

x=1:109;
y=1:109;
z=1:109;
N=109;
rhoh=2.65;
rhol=0.76;

for i=1:length(x)
    for j=1:length(y)
        for k=1:length(z)
            temp = F(x(i),y(j))/0.026;
            %temp = f1(x(i),y(j))/0.026;
            %tmp=F1(x(i),y(j))/0.026;     
    if z(k)<=temp
        rho(i,j,k)=rhoh;
    else
        rho(i,j,k)=rhol;
    end
        end
    end
end

%%
xslice =[1,N/2];
    yslice=[1,N/2];
    zslice=N/2;
    xlabel('y')
    ylabel('x')
    zlabel('z')
    slice (x,y,z,rho,xslice,yslice,zslice)
    colormap winter