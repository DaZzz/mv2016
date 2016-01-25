% Cleaning.
clc;
clearvars;
close all;

tmp = imread('images/ex22a.tif');
I = tmp(:,:,1:3);

tform = maketform('affine',[2 0 0; 0 2 0; 0 0 1]);
In = imtransform(I, tform, 'nearest');
Ib = imtransform(I, tform, 'bilinear');

figure(1);
imshow(In);
title('nearest');

figure(2)
imshow(Ib);
title('bilinear');