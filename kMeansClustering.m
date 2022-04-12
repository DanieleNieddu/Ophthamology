function  B = kMeansClustering(A,k)

% A immagine
% k numero di iterazioni

[L,Centers] = imsegkmeans(A,k);
B = labeloverlay(A,L);
imshow(B);





