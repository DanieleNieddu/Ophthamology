function  B = kMeansClustering(A)

[L,C] = imsegkmeans(A,2);
B = label2rgb(L,im2double(C));
B = im2gray(im2single(B));





