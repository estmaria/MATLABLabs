clc
clear
%Traffic Light Suspension Cable
%% Part a.
m = 18; %Mass of light (kg)
g = 9.8; %Gravitational constant (m/s^2)
F_grav = -m * g; %Force exerted by traffic light
fprintf('Part a.\n')
fprintf('m = %8.1f kg\t\t g = %8.1f m/s^2\n',m,g);
fprintf('F_grav = %8.2f N\n\n',F_grav);

%% Part b. - Light at Point B
F_ABy = -F_grav; %Vertical component of AB
F_ABx = F_ABy / tan( 175 * pi/180 ); %Horizontal component of AB
F_AB = sqrt( F_ABx ^ 2 + F_ABy ^ 2 ); %Magnitude of AB
fprintf('Part b. - Light at Point B\n')
fprintf('F_ABx = %+8.1f N\t\t F_ABy = %+8.1f N\n',F_ABx,F_ABy)
fprintf('F_AB = %+8.1f N\n\n',F_AB);
F_BCx = -F_ABx; %Horizontal component of BC
F_BCy = 0; %Vertical component of BC
F_BC = sqrt( F_BCx ^ 2 + F_BCy ^ 2 ); %Magnitude of BC
fprintf('F_BCx = %+8.1f N\t\t F_BCy = %+8.1f N\n',F_ABx,F_ABy)
fprintf('F_BC = %+8.1f N\n\n',F_BC);

%% Part c. - Light at Point C
F_BCx = -F_BCx; %F_BC acting on point C is in the -x direction
F_CDx = -F_BCx; %Horizontal component of CD
F_CDy = -F_grav; %Vertical component of CD
F_CD = sqrt( F_CDx ^ 2 + F_CDy ^ 2 ); %Magnitude of CD
theta_CD = atan(F_CDy/F_CDx) * 180/pi; %Angle from horizontal force acts
fprintf('Part c. - Light at Point C\n')
fprintf('F_CDx = %+8.1f N\t\t F_CDy = %+8.1f N\n',F_CDx,F_CDy)
fprintf('F_CD = %+8.1f N\t\t theta_CD = %+8.3f deg\n\n',F_CD,theta_CD);
%% Part d. - Light at Point D
F_CDx = -F_CDx; %F_CD acting on point d is in the -x direction
F_CDy = -F_CDy; %F_CD acting on point C is in the -y direction
F_DEy = -( F_grav + F_CDy ); %Vertical component of DE
F_DEx = -F_CDx; %Horizontal component of DE
F_DE = sqrt( F_DEx ^ 2 + F_DEy ^ 2 ); %Magnitude of DE
theta_DE = atan(F_DEy/F_DEx) * 180/pi; %Angle from horizontal force acts
fprintf('Part d. - Light at Point D\n')
fprintf('F_DEx = %+8.1f N\t\t F_DEy = %+8.1f N\n',F_DEx,F_DEy)
fprintf('F_DE = %+8.1f N\t\t theta_DE = %+8.3f deg\n\n',F_DE,theta_DE);