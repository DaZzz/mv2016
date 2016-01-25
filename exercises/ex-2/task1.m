% Cleaning.
clc;
clearvars;
close all;

I1 = imread('images/ex21a.tif');
tmp = imread('images/ex21b.tif');
I2 = tmp(:,:,1);

fixedPoints = [115.1667,  114.0425; 621.0490,   75.8203; ...
                63.4542,  631.1667; 571.5850,  601.9379];
            
movingPoints = [101.6765,  66.8268; 598.5654,  127.5327; ...
                 83.6895, 579.4542; 591.8203,  653.6503];

% Manual picking
% [fixedPoints, movingPoints] = ...
%     cpselect(I1,I2, 'Wait', true);

trans = fitgeotrans(movingPoints, fixedPoints,'projective');
Rortho = imref2d(size(I1));
I21 = imwarp(I2,trans,'OutputView',Rortho);
figure, imshowpair(I21, I1)