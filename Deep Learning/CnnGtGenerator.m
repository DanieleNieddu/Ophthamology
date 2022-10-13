clear; close all; clc;

load net;
cartella = "RIM-ONE_DL_images\";
size = [255 255];
imgSet = dir(cartella);
l = length(imgSet);

for i = 3:l
    percorso = strcat(cartella,imgSet(i).name);
    nuovoPercorso = strcat("DL_GT\",imgSet(i).name);
    img = imresize(imread(percorso),size);

    GT = semanticseg(img,net);
    GT = labelConverter(GT);

    imwrite(GT,nuovoPercorso);
end