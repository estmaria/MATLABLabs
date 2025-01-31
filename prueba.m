clc
clear
A=[208 200 207 209 204 210;208 200 207 209 204 210;208 200 207 209 204 210;
    208 200 207 50 204 210;208 200 207 209 204 210;208 200 207 209 204 210];
A
rows=size(A,1);
columns=size(A,2);
for i=2:rows-1
    for j=2:columns-1
        if abs(A(i,j)-A(i+1,j)) > 20 && abs(A(i,j)-A(i-1,j))>20 && abs(A(i,j)-A(i,j+1))>20 &&  abs(A(i,j)-A(i,j-1))>20
            A(i,j)=(A(i+1,j)+ A(i-1,j) + A(i,j+1) + A(i,j-1))/4;
        end
    end
end
A