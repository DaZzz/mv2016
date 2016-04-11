% ---
% In this example it is demonstarted 
% how Viola & Jones algorithm can be used for 
% real time face recognition using webcamera.
% To run this example you will need a webcamera and 
% matlab webcam usb package.
% ---

% Clean up.
clearvars;
close all;
clc;

% Init detector which is pretrained for face recognition.
faceDetector = vision.CascadeObjectDetector;

% Init web camera.
cam = webcam;

% Run detection.
while 1
    I = imresize(snapshot(cam), 0.3);
    bboxes = step(faceDetector, I);
    IFaces = insertObjectAnnotation(I, 'rectangle', bboxes, 'Face');
    imshow(IFaces), title('Detected faces');
end