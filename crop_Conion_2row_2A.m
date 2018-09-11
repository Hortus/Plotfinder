function [BW,maskedImage] = crop_Conion_2row_2A(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [1704.447535 1736.873025 1746.544414 1715.123072];
yPos = [688.193657 702.695632 695.920827 681.733971];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;