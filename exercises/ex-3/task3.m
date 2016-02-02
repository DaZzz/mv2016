s = [...
   1 2 3 4;
   1i 2i 3i 4i;
   2 1 1 1;
   0 -1 0 1;
   2i 1i 1i 1i;
   (4 + 4i) (3 + 2i) (0 + 2i) (3 + 2i);
   0 (1 + 1i) 0 (-1 - 1i)
]

for i=1:size(s,1)
    F = fft(repmat(s(i,:), [1, 40]));
    subplot(2,4,i);
    plot(repmat(s(i,:), [1, 5]));
end