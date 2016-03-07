% Cleaning.
clc;
clearvars;
close all;

% Load image.
In = imread('images/Lena_n.png');
Io = imread('images/Lena_gray.png');

% Select flat area
imshow(In);
rect = round(getrect);
x = rect(1);
y = rect(2);
w = rect(3);
h = rect(4);
Ir = In(y:y+h, x:x+w);

% Calculate mean and variance of the flat area
m = mean(Ir(:));
v = var(double(Ir(:)));

% Fitting
[h, cx] = imhist(Ir);
cftool;

% General model Gauss1:
%      f(x) =  a1*exp(-((x-b1)/c1)^2)
% Coefficients (with 95% confidence bounds):
%        a1 =       103.8  (101.2, 106.3)
%        b1 =       133.1  (132.6, 133.7)
%        c1 =       27.88  (27.09, 28.66)
% 
% Goodness of fit:
%   SSE: 9783
%   R-square: 0.9654
%   Adjusted R-square: 0.9651
%   RMSE: 6.218
