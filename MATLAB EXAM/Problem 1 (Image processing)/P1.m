
clc;
clear;
close all;

imfinfo('Chocolate.jpg');
A=imread('Chocolate.jpg');
figure(1)
imshow(A)
B=rgb2gray(A);
figure(2)
imshow(B)
C=B*3;
figure(3)
imshow(C)
D=imresize(A, 1/3);
figure (4)
imshow(D)
