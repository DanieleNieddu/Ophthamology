%function img = contour_Based_App(A)
load_f;
C = rgb2gray(B);

mask = zeros(size(C));

mask(25:end-25,25:end-25) = 1;

imshow(mask);

BW = activecontour(B,mask,6000);
imshow(BW);



