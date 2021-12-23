clear
close all
initialSim
figure
axis([0 3 -3 3,0,6])
set(gcf,'position',[0,0,1024,1024])
%axis([0 4 -1 2,0,6])
%filename = 'testAnimated1.gif';
%hold on
out = sim('midProj');
%hold off
figure
%axis('tight')
for k = 1:6:size(out.simout)
    detectTime(X,Y,Z,out.simout(k,1),out.simout(k,2),out.simout(k,5),out.simout(k,3),out.simout(k,4));
    hold on
end
view(3)