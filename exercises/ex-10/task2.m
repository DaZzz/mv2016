% Clean up
close all;
clearvars;
clc;

% Original image
I = repmat([21 21 21 95 169 243 243 243], [4 1]);

%% Entropy
[counts, elems] = hist(I(:), unique(I));
p = counts ./ sum(counts(:));
entropy = -sum(arrayfun(@(x) p(elems == x) * log2(p(elems == x)), elems));
fprintf('1) Image entropy: %f \n', entropy);

%% Encoded huffman
dict = huffmandict(elems, p);
fprintf('2) Image encoded: \n');
for i = 1:size(dict)
    fprintf('\t%d: \t %s\n', dict{i,1}, sprintf('%d',dict{i,2}));
end

%% Compression ratio
osz = prod(size(I))*8;
csz = sum(arrayfun(@(x) length(dict{find(elems == x), 2}), elems));
fprintf('3) Compression ratio: %f\n', osz/csz)

%% Adjacent pairs
I1 = I(:,1:2:end) * 256 + I(:,2:2:end);
[counts, elems] = hist(I1(:), unique(I1));
p = counts ./ sum(counts(:));
entropy = -sum(arrayfun(@(x) p(elems == x) * log2(p(elems == x)), elems));
fprintf('4) Entropy of pairs: %f\n', entropy);

%% Subtractions
Is2 = circshift(I,1,2);
Is2(:,1) = 0;
I2 = I - Is2;
[counts, elems] = hist(I2(:), unique(I2));
p = counts ./ sum(counts(:));
entropy = -sum(arrayfun(@(x) p(elems == x) * log2(p(elems == x)), elems));
fprintf('5) Entropy of subtractions: %f\n', entropy);
