function IM = tresholding(G)

%funzione che implementa il tresholding:
% - G -> Immagine in scala di grigi
% - IM -> Immagine in bianco e nero

%I = imread("RIM-ONE\Normal\Im004.bmp");

level = graythresh(G);
IM = imbinarize(G,level);
imshow(IM);

