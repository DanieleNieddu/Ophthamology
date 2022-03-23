%function img = thresholding(A)
A  = imread("RIM-ONE\Normal\Im001.bmp");
G = 0;
C = rgb2gray(A);
[x,y] = size(C);
%Step 1: Select the initial value of the threshold ‘T’
T = 70;

G = zeros([x y]);
nUpper = 0;
nLower = 0;
totL = 0;
totU = 0;

%Step 2: Step 2: Partition the input image into two potions;
%(I) Pixel values greater than and equal to the threshold.
%(II) Pixel values less than the threshold.
for i=1:x
    for j=1:y
        if (C(i,j) >= T)
            G(i,j) = uint8(1);
            nUpper = nUpper+1;
            totU = totU + double(C(i,j));
        else
            nLower = nLower+1;
            totL = totL + double(C(i,j));
        end
    end
end
%Step 3: Find the mean value of two new portions computed in
%"Step 2".
meanU = uint8(totU/nUpper);
meanL = uint8(totL/nLower);
%Step 4: Calculate the new threshold as an average of two means.
newT = (meanU + meanL)/2;
%Step 5: If the difference between the two thresholds new and old
%is below T, terminate. Else, apply the new threshold to an
%input image.
if (newT < T)
    img = C;
else
    img = G;
end
imshow(img);


