A = imread("RIM-ONE\Normal\Im004.bmp");
B = rgb2lab(A);
[L,N] = superpixels(B,1500,"Method","slic");
BW = boundarymask(L);
imshow(imoverlay(A,BW,'cyan'),'InitialMagnification',67);
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
imshow(img);