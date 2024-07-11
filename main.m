clc;
clear
close all
%Giving demanding images as input
PCB=select_image;
IC=select_image;
%Converting RGB images to grayscale 
Gray_IC=rgb2gray(IC);
Gray_PCB=rgb2gray(PCB);
%Rotating IC image 180 degrees for reverse exploring
Rotated_Gray_IC=imrotate(Gray_IC,180);
%Displaying Gray images
figure
subplot(1,2,1)
imshow(Gray_PCB);
subplot(1,2,2)
imshow(Gray_IC);
%Moving IC image above PCB image and calculating ...
%correlation coefficent in every step of moving IC image 
M=corr_matrix(Gray_PCB,Gray_IC);
M_rotated = corr_matrix(Gray_PCB,Rotated_Gray_IC);
%Displaying peaks of the matrix of correlation coefficients in a 3D plot
plot_surface(M,M_rotated);
%finding peaks of the matrix of correlation coefficients and ...
%marking them with rectangles
M_cell = {M; M_rotated};
result = plot_box(PCB,Gray_IC, M_cell,IC);