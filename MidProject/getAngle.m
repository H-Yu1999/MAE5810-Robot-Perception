function [Phi,Pho] = getAngle(x,y,z,X,Y,Z)
dist = sqrt((x-X)^2+(y-Y)^2+(z-Z)^2);
Phi = acos((z-Z)/dist);

if y<Y
    Pho = atan(-(x-X)/(y-Y));
elseif y>Y
    Pho = pi+atan(-(x-X)/(y-Y));
else
    if x>X
        Pho = pi/2;
    else
        Pho = pi+pi/2;
    end
end