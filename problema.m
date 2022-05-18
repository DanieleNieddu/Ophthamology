Imm1 = im2double(imread('RIM-ONE\Normal\Im019.bmp'));
Imm2 = im2double(imread('RIM-ONE\Normal\Im020.bmp'));
Imm3 = im2double(imread("DrishtiGS\drishti-dataset\Normali\drishtiGS_041.png"));
Imm4 = im2double(drishtiCrop(imread("DrishtiGS\drishti-dataset\Normali\drishtiGS_042.png")));
%imshow(Imm4);
x=100; y=100;
l1 = regiongrowing(Imm1,x,y,0.2);
l2 = regiongrowing(Imm2,x,y,0.2);
%l3 = regiongrowing(Imm3,x,y,0.2);
%l4 = regiongrowing(Imm4,x,y,0.2);

imm1 = (Imm1+l1);
imm2 = (Imm2+l2);