imds = imageDatastore("saveprova\","IncludeSubfolders",true,"LabelSource","foldernames");
imdsAugTrain = augmentImages(imds,"saveprova1");