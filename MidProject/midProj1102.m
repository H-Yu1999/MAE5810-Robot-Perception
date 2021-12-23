% x = 1;
% y = 1;
z = 0;
X = 1;
Y = 1;
Z = 6;
for x = 0:0.1:2
    y = sqrt(1-(x-1)^2)+1;
        [Phi,Pho] = getAngle(x,y,z,X,Y,Z);
        %figure
        plot3(x,y,z,'r*','MarkerSize',0.1)
        hold on
        detect(X,Y,Z,Pho,Phi)
    
end
        
        
      