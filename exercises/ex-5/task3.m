% Cleaning.
clc;
clearvars;
close all;

% Load image
In = imread('images/Lena_s.png');
Io = imread('images/Lena_gray.png');

% Sharpen
% Is = imsharpen(In, 'Radius', 2, 'Amount', 1.5);
% Is = imsharpen(In, 'Radius', 3, 'Amount',0.4);

% Diff
Id1 = abs(double(Io)-double(In))./255.*2;
Id2 = abs(double(Io)-double(Is))./255.*2;

images = {Io, In, Is, Id1, Id2};
titles = {'Original', 'Noise', 'Blured', 'Diff Noise', 'Diff Sharpen'};
sz = size(images,2);
for i=1:sz
    subplot(2,round(sz/2),i);
    imshow(images{i});
    title(titles{i});
end

% Display error.
disp('Blured mean error std:');
disp(sqrt(mean(mean((double(Io)-double(In)).^2))));
disp('Sharpened mean error std:');
disp(sqrt(mean(mean((double(Io)-double(Is)).^2))));

