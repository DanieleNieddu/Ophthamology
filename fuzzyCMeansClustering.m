A = imread("RIM-ONE\Normal\Im004.bmp");

fA = mat2gray(A);
level = graythresh(fA);
bwfA = im2bw(fA,level);
data = reshape(fA,[],1);
[center,member] = fcm(data,3);
[center,cidx] = sort(center);
member = member';
member = member(:,cidx);
[maxmember,label] = max(member,[],2);
level = (max(data(label == 1)) + min(data(label == 2)))/2;
bw = im2bw(fA,level);
imshow(bw);