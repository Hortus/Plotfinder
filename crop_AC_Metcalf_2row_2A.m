function [BW,maskedImage] = crop_AC_Metcalf_2row_2A(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [1984.095010 2011.039546 2012.280744 1986.051292];
yPos = [856.741339 880.075579 867.719256 845.169933];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;