%x = -5:0.01:5;
clear all
close all
clc
x1=-5:0.01:5;
for i=1:(length(x1)-2)/3
y(i)= tanh(x1(i));
end
for i=(length(x1)-2)/3:2*(length(x1)-2)/3
y(i)= tanh(x1(i));
end
for i=2*(length(x1)-2)/3:length(x1)
y(i)= tanh(x1(i));
end


x2= -20:0.01:-5;

for i=1:length(x2)
y2(i)=-1;
end

x3= -30:0.01:-20;
for i=1:(length(x3)-2)/3
y3(i)= tanh(-x1(i));
end

for i=(length(x3)-2)/3:2*(length(x3)-2)/3
y3(i)= tanh(-x1(i));
end

for i=2*(length(x3)-2)/3:length(x3)
y3(i)= tanh(-x1(i));
end

x=[x3,x2,x1];
y=[y3,y2,y];

plot(x,y),
grid on
% hold on
% plot(x2,y2)
% plot(x3,y3)