function [BW,maskedImage] = crop_ND021052_oat_2C(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [966.124256 996.730338 1001.799039 970.147272];
yPos = [2116.362708 2136.566612 2128.601510 2107.685455];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;