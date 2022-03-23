

A = imread("RIM-ONE\Normal\Im003.bmp");

[L,C] = imsegkmeans(A,50);
B = label2rgb(L,im2double(C));
imshow(B);





