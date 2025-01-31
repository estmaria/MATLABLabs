%% Plot 3D line
clear
t=0:pi/50:10*pi;
st=sin(2*t);
ct=cos(t);
figure(1)
plot3(st,ct,t,'LineStyle','--','LineWidth', 4,'Color','r');

%% 3D surface
[X,Y]=meshgrid(-1.5:.05:1.5);
Z=X.*exp(-X.^2-Y.^2);
figure(2)
surf(X,Y,Z);

