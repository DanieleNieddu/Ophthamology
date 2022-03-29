clear all;
clc;
close all;

I = im2double(rgb2gray(imread('RIM-ONE\Normal\Im004.bmp')));

J = regiongrowing(I);
imshow(I + J);