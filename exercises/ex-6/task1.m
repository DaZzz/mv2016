% Cleaning.
clc;
clearvars;
close all;

% Load image.
I = imread('images/ex6t1.tif');
If = medfilt2(I, [7,7]);
Ia = adpmedian(I, 7);

subplot(1,3,1);
imshow(I);
title('Original');

subplot(1,3,2);
imshow(If);
title('Median');

subplot(1,3,3);
imshow(Ia);
title('Adaptive Median');