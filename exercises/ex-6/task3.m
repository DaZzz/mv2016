% Cleaning.
clc;
clearvars;
close all;

% Load image.
I = imread('images/ex6t3.png');
imshow(I);

% Motion blur filter (NSR = 0)
m = fspecial('motion', 200, 135);
I0 = deconvwnr(I, m, 0);

% Estimate NSR using flat area
x0 = 1130;
y0 = 130;
x1 = 1250;
y1 = 250;

flat = I(y0:y1, x0:x1);
nsr = var(double(flat(:))) / var(double(I(:)));
I1 = deconvwnr(I, m, nsr);

subplot(1,3,1);
imshow(I);
title('Original');

subplot(1,3,2);
imshow(I0);
title('NSR = 0');

subplot(1,3,3);
imshow(I1);
title(sprintf('NSR = %d', nsr));
