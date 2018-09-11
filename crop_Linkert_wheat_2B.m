function [BW,maskedImage] = crop_Linkert_wheat_2B(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [866.956749 893.214211 895.136446 868.162164];
yPos = [2013.043251 2035.630177 2024.082524 2000.707173];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;