% Cleaning.
clc;
clearvars;
close all;

I = imread('images/ex23a.tif');

Ia= imadjust(I);
Ih = histeq(I);

sz = 3;
Is = cat(sz, I, Ih, Ia);
for i=1:sz
    I = Is(:,:,i);
    
    m = mean(I(:)); % mean value
    zs = unique(I(:)); % uniques
    zc = histc( I(:), zs ); % counts
    L = size(zs); % length
    [M, N] = size(I); % size

    moments = [];
    for n=0:4
        s = sum((double(zs)-m).^n.*(zc./(M*N)));
        moments = [moments s];
    end
    
    subplot(3,sz,i);
    imshow(I);
    subplot(3,sz,i + sz);
    plot(moments);
    subplot(3,sz,i + 2*sz);
    imhist(I);
end