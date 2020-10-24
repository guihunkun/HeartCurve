clear
clc
%构造体积方程和坐标轴，画出图形;
[X,Y,Z] = meshgrid(linspace(-3,3,101));

%3D心型图方程如下;
F = -X.^2.*Z.^3-(9/80).*Y.^2.*Z.^3+(X.^2+(9/4).*Y.^2+Z.^2-1).^3;
hFigure = figure;
sz = get(hFigure, 'Position');
set(hFigure, 'Position', [sz(1)-0.15*sz(3) sz(2) 1.3*sz(3) sz(4)]);
set(hFigure,'color','w', 'menu','none')

hAxes = axes('Parent',hFigure,'NextPlot','add',...
    'DataAspectRatio',[1 1 1],...
    'XLim',[30 120],'YLim',[35 65],'ZLim',[30 75]);
view([-39 30]);
axis off

% 制作出动态的隐形效果;

hidden on

% 画出网格，制作网格动态效果;

% 快渲染心得背面:

p = patch(isosurface(F,-0.001));
set(p,'FaceColor','w','EdgeColor','w');

% 构造Y-Z平面,,描完函数在该平面的点:
for iX = [35 38 41 45 48 51 54 57 61 64 67]
    plane = reshape(F(:,iX,:),101,101);
    cData = contourc(plane,[0 0]);
    xData = iX.*ones(1,cData(2,1));
    plot3(hAxes,xData,cData(2,2:end),cData(1,2:end),'r');
    pause(.1), drawnow
end

% 构造X-Z平面,描完函数在该平面的点:
for iY = [41 44 47 51 55 58 61]
    plane = reshape(F(iY,:,:),101,101);
    cData = contourc(plane,[0 0]);
    yData = iY.*ones(1,cData(2,1));
    plot3(hAxes,cData(2,2:end),yData,cData(1,2:end),'r');
    pause(.1), drawnow
end

% 构造X-Y平面,描完函数在该平面的点:
for iZ = [36 38 40 42 44 46 48 50 52 54 56 58 60 62 64 66 69 71]
    plane = F(:,:,iZ);
    cData = contourc(plane,[0 0]);
    startIndex = 1;
    if size(cData,2) > (cData(2,1)+1)
        startIndex = cData(2,1)+2;
        zData = iZ.*ones(1,cData(2,1));
        plot3(hAxes,cData(1,2:(startIndex-1)),...
                cData(2,2:(startIndex-1)),zData,'r');
    end
    zData = iZ.*ones(1,cData(2,startIndex));
    plot3(hAxes,cData(1,(startIndex+1):end),...
        cData(2,(startIndex+1):end),zData,'r');
    pause(.1), drawnow
end

%函数已经画完,接下来为文字部分;
pause(.2)

%设置字体大小,粗细,位置等,以下是打出I (心型图) Wendy;

text(7,50,70,'I', 'fontWeight','bold','FontAngle','italic','fontsize',60)
pause(.5)
text(80,50,43,'You', 'fontWeight','bold','FontAngle','italic','fontsize',60)
pause(.2)

line([20 80],[50 50],[52.5 52.5], 'color','w')
line([50 50],[20 80],[52.5 52.5], 'color','w')
line([50 50],[50 50],[30 80], 'color','w')

%制作者签名;
text(40,60,30,'Made By 鬼魂 2014/8/2', 'fontsize',8)
text(35,45,30,'', 'fontsize',8)
