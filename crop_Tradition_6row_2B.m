function [BW,maskedImage] = crop_Tradition_6row_2B(X)
X = rgb2gray(X); %convert to grayscale
BW = false(size(X)); %create empty mask
%polygon drawing
xPos = [1143.780661 1194.824697 1225.860156 1174.059843];
yPos = [1792.197796 1825.275477 1776.505469 1743.595400];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;
%create masked image
maskedImage = X;
maskedImage(~BW) = 0;