%Solution 1
%Define the vectors
F_A = [ 106.06 -106.06 0]; %Newtons
r_A = [ 28.284 28.284 0]; %centimeters
F_B = [-106.06 106.06 0]; %Newtons
r_B = [-28.284 -28.284 0]; %centimeters
%Compute the moment using MATLAB's cross product function
M = cross(r_A,F_A) + cross(r_B,F_B); %Newton centimeters
%Convert to Newton meters
M = M/100; %Newton meters
fprintf('The resulting couple moment is = [ %1.2f %1.2f %1.2f ] (Nm)\n', M)