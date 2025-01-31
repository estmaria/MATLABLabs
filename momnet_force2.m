%Solution 1
%Define the vectors
F_A = 150; %Newtons
r_A = 40; %centimeters
F_B = 150; %Newtons
a=45; %angle in degrees
%Compute the moment using MATLAB's cross product function
M = F_A*r_A*sin( a * pi/180 ); %Newton centimeters
%Convert to Newton meters
M = M/100; %Newton meters
fprintf('The resulting couple moment is %1.2f (Nm)\n', M)