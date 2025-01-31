%Single spring-mass system
syms x(t)
m=100; %mass
k=100000; %spring constant
Dx=diff(x,t); %Dx represents dx/dt, which is velocity
D2x=diff(x,t,2); % D2x represents second derivative, which is aceleration
ode=m*D2x+k*x==0; %the differential equation
cond1=x(0)==0; %displacement at t=0 is 0
cond2=Dx(0)==10; %velocity at t=0 is 1
cond=[cond1 cond2];
xSol(t)=dsolve(ode,cond); %solves the differential equation with the initial conditions

figure(1)
fplot(xSol,[0,2]); %el que esta incluido en la grafica
xlabel('Time(s)');
ylabel('Displacement (m)');
title('Displacement');