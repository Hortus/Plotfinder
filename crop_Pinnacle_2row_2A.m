function [BW,maskedImage] = crop_Pinnacle_2row_2A(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [1497.831177 1548.944715 1579.952675 1528.926156];
yPos = [1012.049291 1043.626674 997.198914 968.007325];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;