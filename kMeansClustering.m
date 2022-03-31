function  B = kMeansClustering(A)

k = 3

[L,C] = imsegkmeans(A,3);
B = label2rgb(L,im2double(C));
B = im2gray(im2single(B));





