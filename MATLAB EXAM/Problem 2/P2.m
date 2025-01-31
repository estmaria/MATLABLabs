
clc;
clear;
close all;

%%TWO MASSES THREE SPINGS NO DAMPERS
syms x1(t) x2(t)
m1=10; %mass1
m2=10; %mass2
k1=200; %spring constant 1
k2=1000; %spring constant 2
k3=200; %spring constant 3

Dx1=diff(x1,t);
D2x1=diff(x1,t,2);
Dx2=diff(x2,t);
D2x2=diff(x2,t,2);

ode1=m1*D2x1+(k1+k2)*x1-k2*x2==0;
ode2=m2*D2x2-k2*x1+(k2+k3)*x2==0;
odes=[ode1;ode2];

cond1=x1(0)==2; %displacement m1 at t=0 
cond2=Dx1(0)==2; %velocity m1 at t=0 
cond3=x2(0)==2; %displacement m2 at t=0
cond4=Dx2(0)==-2; %velocity m1 at t=0 
conds=[cond1;cond2;cond3;cond4];

[x1Sol(t),x2Sol(t)]=dsolve(odes,conds); %solves the differential equations with the initial conditions

v1=diff(x1Sol,t);
v2=diff(x2Sol,t);

figure(1)%displays the position
hold on %put the two curves in the same graph
fplot(x1Sol,[0,4],'g','Linewidth',2) %line in green
fplot(x2Sol,[0,4],'r','Linewidth',2) %line in red
xlabel('Time(s)');
ylabel('Position (m)');
title('Position');
legend({'m1 Position', 'm2 Position'}, 'Location', 'southwest');

figure(2) %displays the velocity
hold on
fplot(v1, [0, 4], 'g', 'Linewidth', 2)  
fplot(v2, [0, 4], 'r', 'Linewidth', 2) 
xlabel('Time(s)');
ylabel('Velocity (m/s)');
title('Velocity');
legend({'m1 Velocity', 'm2 Velocity'}, 'Location', 'southwest');

