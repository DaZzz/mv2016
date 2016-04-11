% Clean up
close all;
clearvars;
clc;

I = imread('images/Lena.png');

%% Huffman
[counts, elems] = hist(double(I(:)), unique(double(I(:))));
p = counts ./ sum(counts(:));
dict = huffmandict(elems, p);

osz = size(I,1) * size(I,2) * 3 * 8;
csz = sum(counts .* cellfun(@(x)length(x), dict(:,2))');
fprintf('Huffman compression ratio: %f\n', osz/csz);

%% Huffman subtractions
Is = circshift(I,1,2);
Is(:,1,:) = 0;
I2 = I - Is;
[counts, elems] = hist(double(I2(:)), unique(double(I2(:))));
p = counts ./ sum(counts(:));
dict = huffmandict(elems, p);
osz = size(I2,1) * size(I2,2) * 3 * 8;
csz = sum(counts .* cellfun(@(x)length(x), dict(:,2))');
fprintf('Huffman subtractions compression ratio: %f\n', osz/csz);

%% 
R = I(:,:,1);
[C, S] = wavedec2(R,3,'haar');
pow = 4;

% Huffman
[counts, elems] = hist(double(int32(C(:))), unique(double(int32(C(:)))));
p = counts ./ sum(counts(:));
dict = huffmandict(elems, p);
osz = size(C,1) * size(C,2) * 3 * 8;
csz = sum(counts .* cellfun(@(x)length(x), dict(:,2))');
fprintf('Huffman haar decomposition compression ratio: %f\n', osz/csz);
R0 = waverec2(C,S,'haar')/255;
MSE = sqrt(mean((double(R(:)) - R0(:)*255).^2));
fprintf('MSE = %f\n', MSE);

% Quantization
sft = 1;
for i=1:size(S,1)-1
    len = S(i,1)*S(i,2);
    C(sft:sft+len) = round(C(sft:sft+len)/i^pow);
    sft = sft+len;
end

% Huffman
[counts, elems] = hist(double(int32(C(:))), unique(double(int32(C(:)))));
p = counts ./ sum(counts(:));
dict = huffmandict(elems, p);
osz = size(C,1) * size(C,2) * 3 * 8;
csz = sum(counts .* cellfun(@(x)length(x), dict(:,2))');
fprintf('Huffman haar decomposition + quantization compression ratio: %f\n', osz/csz);

% Dequantization
sft = 1;
for i=1:size(S,1)-1
    len = S(i,1)*S(i,2);
    C(sft:sft+len) = C(sft:sft+len)*i^pow;
    sft = sft+len;
end

R0 = waverec2(C,S,'haar')/255;
imshow(R0);
MSE = sqrt(mean((double(R(:)) - R0(:)*255).^2));
fprintf('MSE = %f\n', MSE);


