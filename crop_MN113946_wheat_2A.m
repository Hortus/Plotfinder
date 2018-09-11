function [BW,maskedImage] = crop_MN113946_wheat_2A(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [1300.947874 1351.623388 1382.572574 1331.856136];
yPos = [1879.951808 1909.075865 1864.962954 1833.459589];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;