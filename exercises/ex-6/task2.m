% Cleaning.
clc;
clearvars;
close all;

% Load image.
I = imread('images/Lena_fn.png');

% Fourier
F = fftshift(fft2(I));
If = mat2gray(log(abs(F) + 1));

% Filtered
FF = F;
FF(:, 129) = 0;
FF(:, 385) = 0;
FF(289, :) = 0;
FF(225, :) = 0;

Iff = mat2gray(log(abs(FF) + 1));

% Image filtered
II = uint8(ifft2(ifftshift(FF)));

subplot(2,2,1);
imshow(I);
title('Original');

subplot(2,2,2);
imshow(If);
title('Original Frequency');

subplot(2,2,3);
imshow(II);
title('Filtered');

subplot(2,2,4);
imshow(Iff);
title('Filtered Frequency');