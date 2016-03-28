% Cleaning.
clc;
clearvars;
close all;

I = imread('images/ex9t3.tif');

% Structuring elements
SE1 = strel('disk', 1);
SE2 = strel('disk', 3);
SE3 = strel('disk', 5);

% Noise reduction
I1 = imopen(I, SE1);
I2 = imopen(I, SE2);
I3 = imopen(I, SE3);

% Plotting
figure;
is = {I, I1, I2, I3};
ts = {'Noisy', 'Opening Disk R=1', 'Opening Disk R=3', 'Opening Disk R=5'};
subx = length(is);
suby = 1;
for subc = 1:length(is)
    subplot(suby, subx, subc);
    imshow(is{subc});
    title(ts{subc});
end