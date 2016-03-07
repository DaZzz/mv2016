% Cleaning.
clc;
clearvars;
close all;

% PDFs.
pr = @(r)(2 - 2*r);
pz = @(z)(2*z);

% CDFs.
Pr = @(r)(2*r - r.^2);
Pz = @(z)(z.^2);

% Transformation.
% T = @(r)(sqrt(2*r - r.^2));
T = @(r)(2 - r);

% Transformed CDF.
% PzT = @(r)(Pz(T(r)));
prT = @(r)(T(pr(r)));

% Plotting distributions.
figure('name', 'Histogram transformation');
plotI = {pr, pz, Pr, Pz, T, prT};
plotTitles = {'p_r(r)', 'p_z(z)', 'P_r(r)', 'P_z(z)', 'T(r)', 'pr(T(r))'};
subx = 2;
suby = 3;
x = 0:0.01:1;
for subc = 1:size(plotI, 2);
    subplot(suby, subx, subc);
    y = plotI{subc}(x);
    plot(x, y);
    title(plotTitles{subc});
end