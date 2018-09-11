function [BW,maskedImage] = crop_Conion_2row_2B(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [1845.327539 1890.613331 1912.558018 1869.812593];
yPos = [1242.997230 1276.344412 1231.195294 1197.256100];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;