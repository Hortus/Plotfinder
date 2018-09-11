function [BW,maskedImage] = crop_GOPHER_oat_2A(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [1934.650786 1964.151175 1966.547243 1937.942079];
yPos = [801.972174 824.443716 813.947766 792.259190];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;