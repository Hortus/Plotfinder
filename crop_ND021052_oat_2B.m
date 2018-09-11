function [BW,maskedImage] = crop_ND021052_oat_2B(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [1398.490266 1451.984121 1486.864555 1432.471306];
yPos = [1979.626547 2003.253708 1965.376332 1939.403353];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;