function BW = contour_Based_App(A1,k)

% A1 immagine da segmentare
% k numero di iterazioni del metodo

%A1 = imread("DrishtiGS\drishti-dataset\Normali\drishtiGS_017.png");
%k = 500;

C = rgb2gray(A1);

mask = zeros(size(C));
[x y] = size(C);

mask(10:end-10,10:end-10) = 1;

BW = activecontour(C,mask,k);





