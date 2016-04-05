% Clean up
close all;
clearvars;
clc;

%% Define functions

psix = @(x) (2/sqrt(3) * pi^(-1/4)) * (1-x^2) * exp(-x^2/2);
psi = @(s, t, x) 1 / sqrt(s) * psix((x-t)/s);
f = @(x) psi(1, 10, x) + psi(6, 80, x);

figure;
fplot(f, [0 120]);
title('Signal example');

%% Calculate cwt
xs = arrayfun(f, 0:0.1:120); 
len = length(xs);

cw1 = cwt(xs,1:80,'haar','plot'); 
title('Continuous Transform, absolute coefficients.') 
ylabel('Scale')

[cw1,sc] = cwt(xs,1:80,'haar','scal');
title('Scalogram') 
ylabel('Scale')

%%
[wp,x] = wpfun('haar',7);
plot(wp(7,:));