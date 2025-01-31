clc;
clear;
close all;
%Triangular prism

%% Define the system
a = 2;  % Length of base side 1
b = 3;  % Length of base side 2
h = 1;  % Height
N = 100000;  % Number of divisions
deltaZ = h / N;  % Thickness of each slice

fprintf('SYSTEM\n');
fprintf('Base length = %3.1f m\t\tBase width = %3.1f m\t\tHeight = %3.1f m\t\tN = %3.0f\t\tdeltaZ = %3.5f\n\n', a, b, h, N, deltaZ);


%% Calculate the Volume
%Sum (pi * (R^2-(i*deltaZ)^2)*deltaZ) for i=1,2,3,4...
V_predicted=0; %initilize volume to zero
for i=1:N
    V_predicted=V_predicted+(h-i*deltaZ)/h*b*deltaZ*a;
end
fprintf('CALCULATE THE VOLUME\n')
fprintf('Predicted Volume = %3.3f m^3\n', V_predicted);
V_actual=1/2*b*h*a;
fprintf('Actual Volume = %3.3f m^3\n\n', V_actual);

%% Calculate the Centroid
numerator=0; %initialized numerator to zero
denominator=0; %initialized denominator to zero
for i=1:N
    numerator=numerator+(i*deltaZ)*(h-i*deltaZ)/h*b*deltaZ*a; %V_predicted*(i*deltaZ)
    denominator=denominator+(h-i*deltaZ)/h*b*deltaZ*a; %same as V_predicted
end
z_bar=numerator/denominator;
fprintf('CALCULATE THE CENTROID\n');
fprintf('Calculated z_bar = %3.3f m\n', z_bar);
z_bar_act=1/3*h;
fprintf('Actual z_bar = %3.3f m\n', z_bar_act);