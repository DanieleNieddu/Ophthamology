function IM = tresholding(I)

G = rgb2gray(I);
level = graythresh(G);
IM = imbinarize(G,level);
imshow(IM);

