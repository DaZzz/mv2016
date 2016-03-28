%% Cleaning.
clc;
clearvars;
close all;

tic;

%% Read image
I = imread('images/ex9t4.tif');
I = I(:,:,1:3);
subplot(2, 2, 1);
imshow(I);
I = rgb2gray(I);
subplot(2, 2, 2);
imshow(I);
I = imcomplement(I);
subplot(2, 2, 3);
imshow(I);

%% Enhance contrast
claheI = adapthisteq(I,'NumTiles',[20 20]);
claheI = imadjust(claheI);
subplot(2, 2, 4);
imshow(claheI);

%% Determine Intensity Surface Area Distribution in Enhanced Image
radius_range = 0:70;
intensity_area = zeros(size(radius_range));
for counter = radius_range
    remain = imopen(claheI, strel('disk', counter));
    intensity_area(counter + 1) = sum(remain(:));
end
figure
plot(intensity_area, 'm - *')
grid on
title('Sum of pixel values in opened image versus radius')
xlabel('radius of opening (pixels)')
ylabel('pixel value sum of opened objects (intensity)')

%% Calculate First Derivative of Distribution
intensity_area_prime = diff(intensity_area);
figure
plot(intensity_area_prime, 'm - *')
grid on
title('Granulometry (Size Distribution) of Candies')
ax = gca;
ax.XTick = 0:5:70;
xlabel('radius (pixels)')
ylabel('Sum of pixel values as a function of radius')

%% Extract candies having particular radius
open5 = imopen(claheI,strel('disk',55));
open6 = imopen(claheI,strel('disk',56));
rad5 = imsubtract(open5,open6);
figure
imshow(rad5,[])

toc;