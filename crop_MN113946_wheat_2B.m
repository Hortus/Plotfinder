function [BW,maskedImage] = crop_MN113946_wheat_2B(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [1063.607131 1095.415086 1103.896842 1070.996393];
yPos = [2166.396570 2183.140960 2176.566495 2159.341663];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;