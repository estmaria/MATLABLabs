clear

%% Define the system
R=7; %radius
N=10; %number of disks
deltaZ=R/N; %calculates disk thickness
fprintf('SYSTEM\n');
fprintf('Radius = %3.1f cm\t\tN = %3.0f\t\tdeltaZ = %3.5f\n\n',R,N,deltaZ);

%% Calculate the Volume
%Sum (pi * (R^2-(i*deltaZ)^2)*deltaZ) for i=1,2,3,4...
V_predicted=0; %initilize volume to zero
for i=1:N
    V_predicted=V_predicted+pi * (R^2-(i*deltaZ)^2*deltaZ);
end
fprintf('CALCULATE THE VOLUME\n')
fprintf('Predicted Volume = %3.3f cm^3\n', V_predicted);
V_actual=2/3*pi*R^3;
fprintf('Actual Volume = %3.3f cm^3\n\n', V_actual);

%% Calculate the Centroid
numerator=0; %initialized numerator to zero
denominator=0; %initialized denominator to zero
for i=1:N
    numerator=numerator+(i*deltaZ)*pi*(R^2-(i*deltaZ)^2)*deltaZ;
    denominator=denominator+pi*(R^2-(i*deltaZ)^2)*deltaZ;
end
z_bar=numerator/denominator;
fprintf('CALCULATE THE CENTROID\n');
fprintf('Calculated z_bar=%3.3f cm\n', z_bar);
z_bar_act=3/8*R;
fprintf('Actual z_bar=%3.3f cm\n', z_bar_act);





