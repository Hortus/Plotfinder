function [BW,maskedImage] = crop_Linkert_wheat_2A(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [1397.491318 1446.778342 1477.784928 1429.030561];
yPos = [963.455303 990.369964 948.795935 924.436367];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;