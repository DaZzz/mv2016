% Cleaning.
clc;
clearvars;
close all;

% Image A
Ar = imread('images/ex7t3AR.tif');
Ag = imread('images/ex7t3AG.tif');
Ab = imread('images/ex7t3AB.tif');

% Image B
Br = imread('images/ex7t3BR.tif');
Bg = imread('images/ex7t3BG.tif');
Bb = imread('images/ex7t3BB.tif');

% Plot original images
subplot(1,2,1);
imshow(cat(3, Ar, Ag, Ab));
title('A');

subplot(1,2,2);
imshow(cat(3, Br, Bg, Bb));
title('B');

% Get gradients
images = {Ar, Ag, Ab, Br, Bg, Bb};
titles = {'A (R)', 'A (G)', 'A (B)', 'B (R)', 'B (G)', 'B (B)'};

% Magnitude
figure;
for i = 1:size(images,2)
    [Gmag, Gdir] = imgradient(double(images{i}));
    subplot(2,3,i);
    imshow(Gmag);
    title(sprintf('Mag %s', titles{i}));
end

% Direction
figure;
for i = 1:size(images,2)
    [Gmag, Gdir] = imgradient(double(images{i}));
    subplot(2,3,i);
    imshow(Gdir);
    title(sprintf('Direction %s', titles{i}));
end


figure;

% Colored A
[GmagAr, GdirAr] = imgradient(double(Ar));
[GmagAg, GdirAg] = imgradient(double(Ag));
[GmagAb, GdirAb] = imgradient(double(Ab));
Amag = cat(3, GmagAr, GmagAg, GmagAb);
Adir = cat(3, GdirAr, GdirAg, GdirAb);

subplot(2,2,1);
imshow(Amag);
title('Magnitude A');

subplot(2,2,2);
imshow(Adir);
title('Direction A');

% Colored B
[GmagBr, GdirBr] = imgradient(double(Br));
[GmagBg, GdirBg] = imgradient(double(Bg));
[GmagBb, GdirBb] = imgradient(double(Bb));
Bmag = GmagBr + GmagBg + GmagBb;
Bdir = GdirBr + GdirBg + GdirBb;
% Bmag = cat(3, GmagBr, GmagBg, GmagBb);
% Bdir = cat(3, GdirBr, GdirBg, GdirBb);

subplot(2,2,3);
imshow(Bmag);
title('Magnitude B');

subplot(2,2,4);
imshow(Bdir);
title('Direction B');
