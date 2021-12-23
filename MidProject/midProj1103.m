% x = 1;
% y = 1;
z = 0;
X = 1;
Y = 1;
Z = 6;
time = 2;
step = 0.02;
p = [0.2,0.4]';
control = zeros(2,time/step+1);
state = zeros(4,time/step+1);
A = [1,0,step,0;
    0,1,0,step;
    0,0,1,0;
    0,0,0,1];
B = [0,0;
    0,0;
    100*pi/180,0;
    0,100*pi/180];
error = zeros(2,time/step+1);
%% initial
t = 0;
x = t;
y = 2
%y = sqrt(1-(t-1)^2)+1;
[PhiDesire,PhoDesire] = getAngle(x,y,z,X,Y,Z);
state(:,1) = [PhoDesire,PhiDesire,0,0]';
control(:,1) = [0,0]';
h = figure;
axis tight manual % this ensures that getframe() returns a consistent size
filename = 'testAnimated.gif';
detect(X,Y,Z,state(1,1),state(2,1))
hold on
plot3(x,y,z,'r*')
%%
k = 0;
for t = step:step:time
    x = t;
    %y = sqrt(1-(x-1)^2)+1;
    y = 2;
    k = k+1;
    floor(t/step);
    [PhiDesire,PhoDesire] = getAngle(x,y,z,X,Y,Z);
    error(:,k) = [PhoDesire-state(1,k),PhiDesire-state(2,k)]';
    control(:,k+1) = p .* error(:,k);
    state(:,k+1) = A*state(:,k)+B*control(:,k);
        
        %figure
    plot3(x,y,z,'r*')
    hold on    
    detect(X,Y,Z,state(1,k),state(2,k));
    frame = getframe(h); 
    im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if k == 1 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
      end 
end
        
        
      