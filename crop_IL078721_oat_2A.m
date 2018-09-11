function [BW,maskedImage] = crop_IL078721_oat_2A(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [1204.463214 1253.952240 1284.880181 1235.556091];
yPos = [1810.129235 1841.235530 1792.953790 1761.269001];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;