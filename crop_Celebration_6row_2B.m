function [BW,maskedImage] = crop_Celebration_6row_2B(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [912.033828 940.708788 943.940119 914.364522];
yPos = [2067.739307 2089.495810 2079.845353 2057.299431];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;