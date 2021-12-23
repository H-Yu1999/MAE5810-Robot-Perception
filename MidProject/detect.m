function qb = detect(xI,yI,zI,Phi,Rou)
O = [xI,yI,zI]';
w = (3.6/2)*(10^(-3));
h = (2.7/2)*(10^(-3));
lambda = 50e-3;
q1 = [w,h,lambda]';
q2 = [w,-h,lambda]';
q3 = [-w,-h,lambda]';
q4 = [-w,h,lambda]';
Rx = [1,0,0;
    0,cos(Rou),-sin(Rou);
    0,sin(Rou),cos(Rou)];
Rz = [cos(Phi),-sin(Phi),0;
    sin(Phi),cos(Phi),0;
    0,0,1];
P = [0,0,1]';
q1f = Rz*Rx*q1+O;
q2f = Rz*Rx*q2+O;
q3f = Rz*Rx*q3+O;
q4f = Rz*Rx*q4+O;
P = Rz*Rx*P+O;
qf = [q1f';q2f';q3f';q4f'];
fill3(qf(:,1),qf(:,2),qf(:,3),'b')
%arrow([O(1),P(1)],[O(2),P(2)],[O(3),P(3)])
qb = zeros(4,3);
for k = 1:4
    qb(k,1) = O(1)+O(3)/(O(3)-qf(k,3))*(qf(k,1)-O(1));
    qb(k,2) = O(2)+O(3)/(O(3)-qf(k,3))*(qf(k,2)-O(2));
    qb(k,3) = 0;
end
hold on
fill3(qb(:,1),qb(:,2),qb(:,3),'b')
for k = 1:4
    l = line([O(1),qb(k,1)],[O(2),qb(k,2)],[O(3),qb(k,3)],'Color',[0.5,0.5,1],'LineWidth',0.01);
    alpha(0.1)
end
%plot3(3.62,3.08,0,'r*')
end