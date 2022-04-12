function img = superpixelClassification(A,k)

%A immagine rgb da segmentare
%k numero di labels

B = rgb2lab(A);
[L,N] = superpixels(B,k,"Method","slic");
BW = boundarymask(L);
%imshow(imoverlay(A,BW,'cyan'),'InitialMagnification',67);
outputImage = zeros(size(A),'like',A);
idx = label2idx(L);
numRows = size(A,1);
numCols = size(A,2);
for labelVal = 1:N
  redIdx = idx{labelVal};
  greenIdx = idx{labelVal}+numRows*numCols;
  blueIdx = idx{labelVal}+2*numRows*numCols;
  outputImage(redIdx) = mean(A(redIdx));
  outputImage(greenIdx) = mean(A(greenIdx));
  outputImage(blueIdx) = mean(A(blueIdx));
end    
img = outputImage;
%img = im2gray(im2single(img));
%imshow(img);