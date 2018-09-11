function [BW,maskedImage] = crop_ND_Genesis_2row_2A(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [1128.062362 1160.082598 1170.715561 1137.639971];
yPos = [2197.170213 2211.479668 2205.557331 2190.931716];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;