function [BW,maskedImage] = crop_AC_Metcalf_2row_2B(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [1648.698275 1699.260502 1729.750268 1679.773505];
yPos = [1112.045568 1144.030047 1095.493775 1063.213063];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;