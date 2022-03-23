clear all;
clc;
close all;

I = im2double(rgb2gray(imread('RIM-ONE\Normal\Im019.bmp')));
imshow(I);

J = regiongrowing(I);
imshow(I + J);