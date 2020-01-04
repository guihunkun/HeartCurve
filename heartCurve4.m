clear
clc
x = 0:0.001:2*pi;
y = 1 + cos(x);
polar(x, y, 'r');
view(90,90)