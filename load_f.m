%script per gestire i vari metodi di segmentazione
clc;
clear;
close all;
A = imread("DrishtiGS\drishti-dataset\Normali\drishtiGS_047.png");
dataSet = cell(8,1);
prompt = "Scegliere il metodo di segmentazione dell'immagine \n" + ...
    "1) Superpixel \n" + ...
    "2) Contourn Based Approach \n" + ...
    "3) Tresholding \n" + ...
    "4) Region Growing \n" + ...
    "5) K means clustering \n" + ...
    "6) Fuzzy C means clustering \n" + ...
    "... : ";
x = input(prompt);
    switch x
        case 1
           dataSet{1} = superpixelClassification(A,3);
           dataSet{2} = superpixelClassification(A,5);
           dataSet{3} = superpixelClassification(A,7);
           dataSet{4} = superpixelClassification(A,10);
           dataSet{5} = superpixelClassification(A,12);
           dataSet{6} = superpixelClassification(A,15);
           dataSet{7} = superpixelClassification(A,25);
           dataSet{8} = superpixelClassification(A,50);
           montage(dataSet);

        case 2
           dataSet{1} = contour_Based_App(A,50);
           dataSet{2} = contour_Based_App(A,100);
           dataSet{3} = contour_Based_App(A,200);
           dataSet{4} = contour_Based_App(A,300);
           dataSet{5} = contour_Based_App(A,400);
           dataSet{6} = contour_Based_App(A,500);
           dataSet{7} = contour_Based_App(A,600);
           dataSet{8} = contour_Based_App(A,800); 
           montage(dataSet);
           
        case 3
            B = nanTresh(A);
            imshow(B);
        case 4
            x = 10; y = 20;
            A1 = im2double(im2gray(A));
            B = regiongrowing(A1,x,y,0.2);
            imshow(A1+B);
        case 5
            dataSet{1} = kMeansClustering (A,3);
            dataSet{2} = kMeansClustering (A,5);
            dataSet{3} = kMeansClustering (A,10);
            dataSet{4} = kMeansClustering (A,12);
            dataSet{5} = kMeansClustering (A,15);
            dataSet{6} = kMeansClustering (A,18);
            dataSet{7} = kMeansClustering (A,20);
            dataSet{8} = kMeansClustering (A,25);
            montage(dataSet);
        case 6
            Ac = drishtiCrop(A);
            B = fuzzyCMeansClustering(Ac);
            imshow(B);
    end

   



