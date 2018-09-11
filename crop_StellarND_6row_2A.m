function [BW,maskedImage] = crop_StellarND_6row_2A(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [1867.984685 1898.911497 1903.376731 1873.438108];
yPos = [767.452638 787.862609 778.622529 758.882973];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;