function BW = contour_Based_App(A1)

C = rgb2gray(A1);

mask = zeros(size(C));

mask(25:end-25,25:end-25) = 1;

imshow(mask);

BW = activecontour(C,mask,500);



