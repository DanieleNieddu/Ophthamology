
 I = im2double(imread('RIM-ONE\Normal\Im001.bmp'));
 x=160; y=270;
 J = regiongrowing(I,x,y,0.2); 
 figure, imshow(I+J);
 img = rgb2gray(I+J);
 imshow(img);
 