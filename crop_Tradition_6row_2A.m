function [BW,maskedImage] = crop_Tradition_6row_2A(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [1766.284190 1817.884584 1843.839209 1794.582936];
yPos = [1162.054209 1196.902274 1149.519165 1113.974079];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;