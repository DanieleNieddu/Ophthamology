function [ imdsAugTrain ] = augmentImages( imds, savePath )


    if( ~exist( savePath, "dir") )
    
        fprintf("Dataset %s does not exist\n", savePath);
        
        GRAY_CONV = 0;
        AUG_LIST = [7]; 

        imdsAugTrain = customAugmentationFunction( imds, savePath, AUG_LIST, GRAY_CONV );
    else
        fprintf("Dataset %s already exist\n", savePath);
        imdsAugTrain = imageDatastore( savePath, 'IncludeSubfolders', true, 'LabelSource', 'foldernames' );
    end
    
end