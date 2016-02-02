% Cleaning.
clc;
clearvars;
close all;

for i=1:3
    I = imread(sprintf('images/ex2%da.tif', i));
    I = I(:,:,1);
    
    F = fft2(I);
    F = fftshift(F); % shift to center
    F = abs(F); % magnitude
    F = log(F+1);
    F = mat2gray(F);
    
    subplot(2,3,i);
    imshow(I);
    title(sprintf('Image %d', i))
    
    subplot(2,3,3+i);
    imshow(F,[]);
    title(sprintf('FT %d', i))
end