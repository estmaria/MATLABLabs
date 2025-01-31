%% This program works for any 2D spring FEM analysis, by Sheng Sang, 2021
clear 
clc
%% Step 1: Input all the parameters and boundry conditions
Nnodes=input('\nEnter the number of nodes:');
Nsprings=input('\nEnter the number of springs:');
conn=input('\nEnter the start and end nodes of each spring in the vector form:'); % [1,2;2,3;3,4;2,4]
spring_constants=input('\nEnter the spring constant of each spring:'); %[k1;k2;k3;k4]
Angle=input('\nEnter the angle each spring:')/360*2*pi; %[theta1;theta2;theta3;theta4]
U=input('\nEnter the displacment vector'); %[NaN;NaN;0;0;NaN]     'NaN is ?' 
F=input('\nEnter the force vector');%[0;0;NaN;NaN;0]     'NaN is ?' 
% The input from the user ends here
%% Step 2: Build Local stiffness matrixes
k=zeros(4,4,Nsprings);
for i=1:Nsprings
    c=cos(Angle(i));
    s=sin(Angle(i));
    k(:,:,i)=spring_constants(i)*[c*c,c*s,-c*c,-c*s;
                              c*s,s*s,-c*s,-s*s; 
                              -c*c,-c*s,c*c,c*s;
                              -c*s,-s*s,c*s,s*s;];
end
%% Step 3: Construct global stiffness matrixes 
K=zeros(Nnodes*2,Nnodes*2);
for i=1:Nsprings
K(conn(i,1)*2-1:conn(i,1)*2,conn(i,1)*2-1:conn(i,1)*2)=K(conn(i,1)*2-1:conn(i,1)*2,conn(i,1)*2-1:conn(i,1)*2)+k(1:2,1:2,i);
K(conn(i,1)*2-1:conn(i,1)*2,conn(i,2)*2-1:conn(i,2)*2)=K(conn(i,1)*2-1:conn(i,1)*2,conn(i,2)*2-1:conn(i,2)*2)+k(3:4,1:2,i);
K(conn(i,2)*2-1:conn(i,2)*2,conn(i,1)*2-1:conn(i,1)*2)=K(conn(i,2)*2-1:conn(i,2)*2,conn(i,1)*2-1:conn(i,1)*2)+k(1:2,3:4,i);
K(conn(i,2)*2-1:conn(i,2)*2,conn(i,2)*2-1:conn(i,2)*2)=K(conn(i,2)*2-1:conn(i,2)*2,conn(i,2)*2-1:conn(i,2)*2)+k(3:4,3:4,i);
end
%% Step 4: solve the problem
K_prime=zeros(nnz(U),nnz(U)); % Define the K_prime, nnz is the function used to find the number of nonzero elements in the vector
U_prime=(U(find(U))); % 'find' is the function used to find corrdinate of nonzero element 
F_prime=(F(find(U)));% 'find' is the function used to find corrdinate of nonzero element 
for i=1:Nnodes
 K_prime=K(find(U),find(U));
end
U_prime=linsolve(K_prime,F_prime);
U(find(U))=U_prime; % Replace the unknowns in the U with displacements found 
%% Show results
fprintf('\n----------Nodal Displacements----------');
fprintf('\nNo.  X-Direction     Y-Direction');
for i=1:Nnodes
    fprintf('\n%5d  %8.3e   %8.3e',i,U(2*i-1),U(2*i));
end