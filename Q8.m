clear all ; close all;
offset = 1e-10;
mul = randi([-5 5]);
sig = 10+mul*offset;
b = 8/3+mul*offset;
r = 28+mul*offset;
y1_0 = 15;
y2_0 = 15;
y3_0 = 36;
Y_0 = [y1_0 + mul*offset ; y2_0 + mul*offset ; y3_0 + mul*offset];
tspan = [0 100];
dY = @(t,y) [sig*(y(2) - y(1)) ; r*y(1) - y(2) - y(1)*y(3) ; y(1)*y(2) - b*y(3)];
[t,Y] = ode45(dY,tspan,Y_0);
figure(1)
plot(t,Y(:,1),'r',t,Y(:,2),'k',t,Y(:,3),'b');
title('y1, y2, y3 vs t');
legend('y1','y2','y3');
figure(2)
plot(Y(:,1),Y(:,2));
title('y1 vs y2');
figure(3)
plot(Y(:,1),Y(:,3));
title('y1 vs y3');
figure(4)
plot(Y(:,2),Y(:,3));
title('y2 vs y3');
% figure(5)
% plot3(Y(:,1),Y(:,2),Y(:,3));