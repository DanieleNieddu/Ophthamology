%script per gestire i vari metodi di segmentazione

A = imread("DrishtiGS\drishti-dataset\Normali\drishtiGS_009.png");

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
    case 2
        B = contour_Based_App(A);
    case 3
        B = tresholding(A);
    case 4
        B = regiongrowing(A);
    case 5
        B = kMeansClustering(A);
    case 6 
        B = fuzzyCMeansClustering(A);
end

imshow(B);

