clc;
clearvars;
close all;

% Functions
en = @(glcm) -sum(glcm(:)./sum(glcm(:)).*log2(glcm(:)./sum(glcm(:))));
mp = @(glcm) max(glcm(:)./sum(glcm(:)));

% Variables setup
I1 = imread('images/ex11t2a.tif');
I2 = imread('images/ex11t2b.tif');
I3 = imread('images/ex11t2c.tif');
images = {I1, I2, I3};
titles = {'A', 'B', 'C'};

for i=1:size(images, 2)
    glcm = graycomatrix(images{i}, 'Offset', [0 1]);
    props = graycoprops(glcm);
    
    fprintf('###\n# Image %s\n###\n', titles{i});
    fprintf('Constrast: %f\n', props.Contrast);
    fprintf('Correlation: %f\n', props.Correlation);
    fprintf('Energy: %f\n', props.Energy);
    fprintf('Homogeneity: %f\n', props.Homogeneity);
    fprintf('Reverse size: %f\n', 1/length(glcm(:)));
    fprintf('Maximum probability: %f\n',  mp(glcm));
    fprintf('Entropy: %f\n\n', en(glcm));
    
    subplot(2, size(images, 2), i);
    imshow(images{i});
    title(sprintf('Image %s', titles{i}));
    
    subplot(2, size(images, 2), size(images, 2) + i);
    imshow(glcm./max(glcm(:)));
    title(sprintf('Co-oc. Matrix %s', titles{i}));
end

