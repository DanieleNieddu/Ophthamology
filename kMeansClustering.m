function  B = kMeansClustering(A,k)

% A immagine
% k numero di iterazioni

[L,~] = imsegkmeans(A,k);
B = labeloverlay(A,L);
imshow(B);





