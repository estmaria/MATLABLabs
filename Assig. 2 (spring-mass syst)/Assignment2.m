%FOUR MASSES FIVE SPRINGS

syms x1(t) x2(t) x3(t) x4(t)
% Define masses and spring constant
m1=10;
m2=10;
m3=10;
m4=10;
k1=1000;
k2=1000;
k3=1000;
k4=1000;
k5=1000;
% Define the first and second derivatives of the four displacements
Dx1=diff(x1,t);
D2x1=diff(x1,t,2);
Dx2=diff(x2,t);
D2x2=diff(x2,t,2);
Dx3=diff(x3,t);
D2x3=diff(x3,t,2);
Dx4=diff(x4,t);
D2x4=diff(x4,t,2);
% Define the ODEs using the mass and spring constants
ode1=m1*D2x1+(k1+k2)*x1-k2*x2==0;
ode2=m2*D2x2-k2*x1+(k2+k3)*x2-k3*x3==0;
ode3=m3*D2x3-k3*x2+(k3+k4)*x3-k4*x4==0;
ode4=m4*D2x4-k4*x3+(k4+k5)*x4==0;
odes=[ode1;ode2;ode3;ode4];
% Define the initial conditions
cond1=x1(0)==0;
cond2=Dx1(0)==1;
cond3=x2(0)==0;
cond4=Dx2(0)==0;
cond5=x3(0)==0;
cond6=Dx3(0)==0;
cond7=x4(0)==0;
cond8=Dx4(0)==0;
conds=[cond1, cond2, cond3, cond4, cond5, cond6, cond7, cond8];
% Solve the differential equations
[x1Sol(t), x2Sol(t), x3Sol(t), x4Sol(t)]=dsolve(odes,conds);

%Plots the solutions
figure(1)
hold on
fplot(x1Sol,[0,1],'Linewidth',4);
fplot(x2Sol,[0,1],'Linewidth',4);
fplot(x3Sol,[0,1],'Linewidth',4);
fplot(x4Sol,[0,1],'Linewidth',4);
xlabel('Time(s)');
ylabel('Displacement (m)');
title('Displacement of different masses');
legend({'m1', 'm2','m3','m4'}, 'Location', 'southwest');