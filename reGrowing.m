
 I = im2double(imread('RIM-ONE\Normal\Im019.bmp'));
 x=250; y=150;
 J = regiongrowing(I,x,y,0.2); 

 imm = im2gray(I+J);
 adz = imadjust(imm);
 adz = im2bw(adz);
 imshow(adz);

 


 