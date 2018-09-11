function [BW,maskedImage] = crop_ND021052_oat_2A(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [1842.970218 1875.090032 1880.277034 1849.226208];
yPos = [736.607541 756.287092 748.136090 729.091673];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;