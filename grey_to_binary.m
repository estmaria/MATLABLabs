
clear
A=imread('Rice.jpg');
B=rgb2gray(A);
figure(1)
imshow(A);

for i=1:365
    for j=1:356
        if B(i,j)>250
            B(i,j)=255; % 255=white
        else
            B(i,j)=0;% 0=black
        end
    end
end


figure(2)
imshow(B);