% Cleaning.
clc;
clearvars;
close all;

% Load image.
In = imread('images/Lena_n.png');
Io = imread('images/Lena_gray.png');

% Filtering.
If = imgaussfilt(In, 1) + 12;

images = {Io, In, If};
sz = size(images,2);
for i=1:sz
    subplot(1,sz,i);
    imshow(images{i});
end

% Display error.
disp('Noised mean error std:');
disp(sqrt(mean(mean((double(Io)-double(In)).^2))));
disp('Filtered mean error std:');
disp(sqrt(mean(mean((double(Io)-double(If)).^2))));

