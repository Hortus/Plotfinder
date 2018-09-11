function [BW,maskedImage] = crop_GOPHER_oat_2B(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [1614.371554 1670.136408 1700.944423 1645.928947];
yPos = [1043.241536 1078.357074 1029.944477 995.888175];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;