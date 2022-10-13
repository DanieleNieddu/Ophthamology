
clear; close all; clc;

size = [255 255];

DLdisc = "DL_GT\";
DLcup = "OL_GT\";
GTdisc = "GT_Disc\";
GTcup = "GT_Cup";

discSet = dir("GT_Disc\");
cupSet = dir("GT_Cup\");
DLDiscSet = dir("DL_GT\");
DLCupSet = dir("OL_GT\");
cupAcc = zeros(1,485);
discAcc = zeros(1,485);

for i = 3:length(discSet)
    pat1 = strcat(GTdisc, discSet(i).name);
    pat2 = strcat(DLdisc,DLDiscSet(i).name);

    img1 = imresize(imread(pat1),size);
    img2 = imread(pat2);

    discAcc(1,i-2) = compareBW(img1,img2);

    %{
    pat1 = strcat(GTcup, cupSet(i).name);
    pat2 = strcat(DLcup, DLCupSet(i).name);
    
    img1 = imresize(imread(pat1),size);
    img2 = imread(pat2);

    cupAcc(1,i-2) = compareBW(img1,img2);
    %}
end





    
        
    


