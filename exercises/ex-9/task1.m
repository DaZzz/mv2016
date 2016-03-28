% Cleaning.
clc;
clearvars;
close all;

% Params
L = 20;

% Original image
A = zeros(5*L, 5*L);
A(2*L+1:3*L,L+1:4*L) = 1;
A(L+1:4*L,2*L+1:3*L) = 1;

% Structural elements
B1 = strel('rectangle', [L/4 L]);
B2m = zeros(L/4*3);
B2m(L/4+1:2*L/4,:) = 1;
B2m(:,L/4+1:2*L/4) = 1;
B2 = strel('arbitrary', B2m);
B3 = strel('square', L/2);
B4 = strel('disk', L/2);

% Operations
% (A - B4) + B2
A1 = imerode(A, B4);
A1 = imdilate(A1, B2);
% (A - B1) + B3
A2 = imerode(A, B1);
A2 = imdilate(A2, B3);
% (A + B1) + B3
A3 = imdilate(A, B1);
A3 = imdilate(A3, B3);
% (A + B3) - B2
A4 = imdilate(A, B3);
A4 = imerode(A4, B2);

% Plotting
figure;
is = {A, A1, A2, A3, A4};
ts = {'A', '(A - B4) + B2', '(A - B1) + B3', '(A + B1) + B3',...
      '(A + B3) - B2'};
subx = length(is);
suby = 1;
for subc = 1:length(is)
    subplot(suby, subx, subc);
    imshow(is{subc});
    title(ts{subc});
end