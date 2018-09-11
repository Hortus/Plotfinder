function [BW,maskedImage] = crop_AC_Metcalf_2row_2C(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [1006.561892 1037.123495 1043.602763 1012.015315];
yPos = [2121.117027 2139.877615 2131.919192 2112.547362];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;