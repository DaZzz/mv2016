% Cleaning.
clc;
clearvars;
close all;

I = imread('images/ex9t2.tif');
SE1 = strel('arbitrary', [0 1 0; 1 1 1; 0 1 0]);
SE2 = strel('square', 3);

I1 = xor(I, imdilate(I, SE1));
I2 = xor(I, imdilate(I, SE2));

% Plotting
figure;
is = {I, I1, I2};
ts = {'Original', 'Cross 3x3', 'Square 3x3'};
subx = length(is);
suby = 1;
for subc = 1:length(is)
    subplot(suby, subx, subc);
    imshow(is{subc});
    title(ts{subc});
end