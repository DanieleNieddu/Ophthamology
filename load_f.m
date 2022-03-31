%script per gestire i vari metodi di segmentazione

A = imread("DrishtiGS\drishti-dataset\Normali\drishtiGS_007.png");

prompt = "Scegliere il metodo di segmentazione dell'immagine \n" + ...
    "1) Superpixel \n" + ...
    "2) Contourn Based Approach \n" + ...
    "3) Tresholding \n" + ...
    "4) Region Growing \n" + ...
    "5) K means clustering \n" + ...
    "6) Fuzzy C means clustering \n" + ...
    "... : "
x = input(prompt);
    switch x
        case 1
            B = superpixelClassification(A);
            imshow(B);
        case 2
            B = contour_Based_App(A);
            imshow(B);
        case 3
            B = tresholding(A);
            imshow(B);
        case 4
            B = regiongrowing(A);
            imshow(B);
        case 5
            B = kMeansClustering(A);
            imshow(B);
        case 6 
            B = fuzzyCMeansClustering(A);
            imshow(B);
end



