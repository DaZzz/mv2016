% Cleaning.
clc;
clearvars;
close all;

% Size
size = 128;

% Channels
fr = @(x) (size - x) / size;
R = repmat(fr(1:size), [size, 1]);

fg = @(x) ((size / 2) - abs(x - size/2))/(size/2);
G = repmat(fg(1:size), [size, 1]);

fb = @(x) 1 - (size - x) / size;
B = repmat(fb(1:size), [size, 1]);

% Image
I = cat(3, R, G, B);
Ihsi = rgb2hsl(I);

% Plotting
subplot(2,2,1);
imshow(I);
title('Original');

subplot(2,2,2);
imshow(Ihsi(:,:,1));
title('Hue');

subplot(2,2,3);
imshow(Ihsi(:,:,2));
title('Saturation');

subplot(2,2,4);
imshow(Ihsi(:,:,3));
title('Intensity');

% Gray shades
disp(sprintf('Amount of gray shades = %d', 2^8));


