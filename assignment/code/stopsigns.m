% ---
% In this files the whole process of the application 
% of Viola & Jones including training stage. For training
% we used pictures embeded in matlab.
% ---

% Clean up.
clearvars;
close all;
clc;

% Load labeled dataset.
load('stopSigns.mat');

% Path to positive samples.
imDir = fullfile(matlabroot,'toolbox','vision','visiondata','stopSignImages');
addpath(imDir);

% Path to ngative samples.
negativeFolder = fullfile(matlabroot,'toolbox','vision','visiondata','nonStopSigns');

% Train detector.
trainCascadeObjectDetector('stopSignDetector.xml',data,negativeFolder,'FalseAlarmRate',0.2,'NumCascadeStages',5);

% Create detector.
stopSignDetector = vision.CascadeObjectDetector('stopSignDetector.xml');

% Detect stop sign.
I = imread('stopSign.jpg');
bboxes = step(stopSignDetector, I);
ISigns = insertObjectAnnotation(I, 'rectangle', bboxes, 'Sign');
imshow(ISigns);

% Remove positive image directory from the path.
rmpath(imDir);
