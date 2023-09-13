
figure(1)

%% Q1 x"=t^2+4
syms x(t)
Dx=diff(x,t);

ode=diff(x,t,2)== t.^2+4;
cond1=x(0)==2;
cond2=Dx(0)==0;
conds=[cond1 cond2];
xSol(t)=dsolve(ode,conds);

subplot(2,3,1)
fplot(xSol,[0,20],'-r','LineStyle','--','Linewidth',4) 
xlabel('Time(s)');
ylabel('Displacement (x)');
title('Graph');

%% Q2 x"=x+10
syms x(t)
Dx=diff(x,t);

ode=diff(x,t,2)== x+10;
cond1=x(0)==2;
cond2=Dx(0)==0;
conds=[cond1 cond2];
xSol(t)=dsolve(ode,conds);

subplot(2,3,2)
fplot(xSol,[0,20],'-r','LineStyle','--','Linewidth',4) 
xlabel('Time(s)');
ylabel('Displacement (x)');
title('Graph');

%% Q3 x"=sqrt(t)
syms x(t)
Dx=diff(x,t);

ode=diff(x,t,2)== sqrt(t);
cond1=x(0)==2;
cond2=Dx(0)==0;
conds=[cond1 cond2];
xSol(t)=dsolve(ode,conds);

subplot(2,3,3)
fplot(xSol,[0,20],'-r','LineStyle','--','Linewidth',4) 
xlabel('Time(s)');
ylabel('Displacement (x)');
title('Graph');

%% Q4 
syms x(t)
Dx=diff(x,t);

ode=diff(x,t,2)== sin(x);
cond1=x(0)==0;
cond2=Dx(0)==0;
conds=[cond1 cond2];
xSol(t)=dsolve(ode,conds);

subplot(2,3,4)
fplot(xSol,[0,20],'-r','LineStyle','--','Linewidth',4) 
xlabel('Time(s)');
ylabel('Displacement (x)');
title('Graph');

%% Q5
syms x(t)
Dx=diff(x,t);

ode=diff(x,t,2)== sin(t)+t;
cond1=x(0)==2;
cond2=Dx(0)==0;
conds=[cond1 cond2];
xSol(t)=dsolve(ode,conds);

subplot(2,3,5)
fplot(xSol,[0,20],'-r','LineStyle','--','Linewidth',4) 
xlabel('Time(s)');
ylabel('Displacement (x)');
title('Graph');

%% Q6
syms x(t)
Dx=diff(x,t);

ode=diff(x,t,2)== sin(t)+cos(t);
cond1=x(0)==2;
cond2=Dx(0)==0;
conds=[cond1 cond2];
xSol(t)=dsolve(ode,conds);

subplot(2,3,6)
fplot(xSol,[0,20],'-r','LineStyle','--','Linewidth',4) 
xlabel('Time(s)');
ylabel('Displacement (x)');
title('Graph');
