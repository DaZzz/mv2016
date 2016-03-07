% Cleaning.
clc;
clearvars;
close all;

% Load image.
I = imread('images/ex4t3.jpg');
I = rgb2gray(I);

% Histogram.
[counts, bins] = imhist(I);

% Histogram equalization.
[Ieq, ~] = histeq(I);

% Image difference.
Idif = imabsdiff(I, Ieq);

% New histogram
L = 256;
h = zeros(1,L);
f = @(x)(sqrt(x.^4));
h = f((1:L)./L);
h = h/sum(h)*numel(I);
I1 = histeq(I, h);

IMAGES = {I, Ieq, Idif, I1};
TITLES = {'Original', 'Equalized', 'Diff', 'My filter'};
for i=1:size(IMAGES, 2)
    subplot(2, size(IMAGES, 2), i);
    imshow(IMAGES{i});
    title(TITLES{i});
    
    subplot(2, size(IMAGES, 2), size(IMAGES, 2) + i);
    imhist(IMAGES{i});
end

