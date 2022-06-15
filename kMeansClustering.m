%function  B = kMeansClustering(A,k)

A = im2gray(imread("DrishtiGS\drishti-dataset\Normali\drishtiGS_017.png"));
k = 5;

% A immagine
% k numero di iterazioni

[L,~] = imsegkmeans(A,k);
B = labeloverlay(A,L);
imshow(B);





