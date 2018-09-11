function [BW,maskedImage] = crop_Rollag_wheat_2A(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [1051.700987 1099.616402 1128.609106 1078.512532];
yPos = [1719.302799 1752.970154 1705.258910 1672.549263];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;