function [BW,maskedImage] = crop_Celebration_6row_2A(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [957.746154 1000.813191 1024.794262 979.187315];
yPos = [1653.088909 1688.038146 1641.803906 1607.359831];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;