%script di partenza per ottenere un'immagina già divisa in superpixels

A = imread("RIM-ONE\Normal\Im001.bmp");
B = superpixelClassification(A);
