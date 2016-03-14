% Cleaning.
clc;
clearvars;
close all;

H = imread('images/ex7t2H.tif');
S = imread('images/ex7t2S.tif');
I = imread('images/ex7t2I.tif');

RGB = hsl2rgb(double(cat(3, H, S, I)) / 255);
images = {RGB, H, S, I};
titles = {'Original', 'Hue', 'Saturation', 'Intensity'};

for i = 1:size(images,2)
    subplot(2,2,i);
    imshow(images{i});
    title(titles{i});
end
