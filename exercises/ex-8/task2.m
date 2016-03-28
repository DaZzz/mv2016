% Cleaning.
clc;
clearvars;
close all;

mo = 150;
so = 20;
po = 0.2;

mb = 25;
sb = 25;
pb = 0.8;

A = so^2 - sb^2;
B = 2 * (mo * sb^2 - mb * so^2);
C = so^2 * mb^2 - sb^2 * mo^2 + 2*so^2*sb^2*log((sb*po)/(so*pb));

T1 = (- B + sqrt(B^2 - 4*A*C))/(2*A);
T2 = (- B - sqrt(B^2 - 4*A*C))/(2*A);

fo = @(x) 1/(so * sqrt(2*pi)) * exp(- (x - mo)^2/(2*so^2));
fb = @(x) 1/(sb * sqrt(2*pi)) * exp(- (x - mb)^2/(2*sb^2));

hold on;
fplot(fo, [-100,1000]);
fplot(fb, [-100,1000]);
hold off;
