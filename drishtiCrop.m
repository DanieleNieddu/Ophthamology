function I = drishtiCrop(A)

target = [1400 1400];
r = centerCropWindow2d(size(A),target);
I = imcrop(A,r);