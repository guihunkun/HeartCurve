clear
clc
x = 0:0.001:2*pi;
y = 1 + cos(x);
polar(x, y, 'r')
m = moviein(15);
for i = 1:15
    view(-37.5+24*(i-1),60)
    m(:,i) = getframe;
    pause(0.2);
end
movie(m)
