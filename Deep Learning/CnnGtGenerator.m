%clear; close all; clc;

%load net2;
cartella = "saveprova\D_img\";
size = [255 255];
imgSet = dir(cartella);
l = length(imgSet);

for i = 3:l
    percorso = strcat(cartella,imgSet(i).name);
    nuovoPercorso = strcat("DR_p\",imgSet(i).name);
    img = imresize(imread(percorso),size);

    GT = semanticseg(img,net2);
    GT = labelConverter(GT);

    imwrite(GT,nuovoPercorso);
end