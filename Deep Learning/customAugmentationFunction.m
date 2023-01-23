%--------------------------------------------------------------------------
% This matlab custom function takes in a text file of images url along with
% label, a destination folder link and a output text file name
% This function takes in each images of the input text gives out
% 1. Normal image
% 2. Random rotated image
% 3. Random scaled image
% 4. Random reflection image along X axis
% 5. Random reflection image along Y axis
% 6. Random X shear
% 7. Random Y shear
% 8. Random X translation
% 9. Random Y translation
% 10. Grayscale image
%

function imdsAug = customAugmentationFunction(imds, destination, augmentationList, grayConversion)

    labels = unique(imds.Labels);
    
    % if the destination folder does not exist create a new folder
    if( exist(destination, 'dir') ~= 7 )
        mkdir(destination)
    end
    for l = 1:numel(labels)
        labelPath = fullfile( destination, string(labels(l)) );
        if( exist(labelPath, 'dir') ~= 7 )
            mkdir(labelPath);
        end
    end
    
    % Reading the image one by one and performing the augmentation
    for im = 1:numel( imds.Files )
        
        image = imread(imds.Files{im});
        label = string(imds.Labels(im));
        [~, imageName, imageExt] = fileparts( imds.Files{im} );
        
        % Augmenting the original image set
        augmentedImages = [];
        for augMethod = augmentationList
            switch augMethod
                case 1
                    augmentation1 = imageDataAugmenter('RandRotation', [0, 360]); % Random Rotation
                    random_rotation90 = augment(augmentation1, image);
                    augmentedImages = [augmentedImages; {random_rotation90}, 'random_rotation'];
                case 2
                    augmentation2 = imageDataAugmenter1('RandScale', [0.5, 1]); % Random Scale
                    random_scale = augment(augmentation2, image);
                    augmentedImages = [augmentedImages; {random_scale}, 'random_scale'];
                case 3
                    augmentation3 = imageDataAugmenter('RandXReflection', true); % X Reflection
                    random_x_reflection = augment(augmentation3, image);
                    augmentedImages = [augmentedImages; {random_x_reflection}, 'random_x_reflection'];
                case 4
                    augmentation4 = imageDataAugmenter('RandYReflection', true); % Y Reflection
                    random_y_reflection = augment(augmentation4, image);
                    augmentedImages = [augmentedImages; {random_y_reflection}, 'random_y_reflection'];
                case 5
                    augmentation5 = imageDataAugmenter('RandXShear', [0, 45]); % Random X shear
                    random_x_shear = augment(augmentation5, image);
                    augmentedImages = [augmentedImages; {random_x_shear}, 'random_x_shear'];
                case 6
                    augmentation6 = imageDataAugmenter('RandYShear', [0, 45]); % Random Y shear
                    random_y_shear = augment(augmentation6, image);
                    augmentedImages = [augmentedImages; {random_y_shear}, 'random_y_shear'];
                case 7
                    augmentation7 = imageDataAugmenter1('RandXTranslation', [0 45]); % Random X translation
                    random_x_translation = augment(augmentation7, image);
                    augmentedImages = [augmentedImages; {random_x_translation}, 'random_x_translation'];
                case 8
                    augmentation8 = imageDataAugmenter1('RandYTranslation', [0 45]); % Random Y translation
                    random_y_translation = augment(augmentation8, image);
                    augmentedImages = [augmentedImages; {random_y_translation}, 'random_y_translation'];
                case 9
                    augmentation1 = imageDataAugmenter('RandRotation', [90 90]); % Random Rotation
                    augmentation2 = imageDataAugmenter('RandRotation', [180 180]); % Random Rotation
                    augmentation3 = imageDataAugmenter('RandRotation', [270 270]); % Random Rotation
                    
                    augmentation4 = imageDataAugmenter('RandXReflection', true); % X Reflection
                    augmentation5 = imageDataAugmenter('RandYReflection', true); % Y Reflection
                    
                    applying all the augmentations
                    Applying the augment operation on original image
                    random_rotation90 = augment(augmentation1, image);
                    random_rotation180 = augment(augmentation2, image);
                    random_rotation270 = augment(augmentation3, image);
                    random_x_reflection = augment(augmentation4, image);
                    random_y_reflection = augment(augmentation5, image);
                    
                    augmentedImages = [augmentedImages; [{image}, 'source']; ...
                        [{random_rotation90}, 'random_rotation90'];...
                        [{random_rotation180}, 'random_rotation180']; ...
                        [{random_rotation270}, 'random_rotation270']; ...
                        [{random_x_reflection}, 'random_x_reflection']; ...
                        [{random_y_reflection}, 'random_y_reflection']];               
                case 10     % augmented + original images
                    augmentation1 = imageDataAugmenter('RandRotation', [90 90]); % Random Rotation
                    augmentation2 = imageDataAugmenter('RandRotation', [180 180]); % Random Rotation
                    augmentation3 = imageDataAugmenter('RandRotation', [270 270]); % Random Rotation
                    
                    random_rotation90 = augment(augmentation1, image);
                    random_rotation180 = augment(augmentation2, image);
                    random_rotation270 = augment(augmentation3, image);
                    
                    augmentedImages = [augmentedImages; [{image}, 'source']; ...
                        [{random_rotation90}, 'random_rotation90'];...
                        [{random_rotation180}, 'random_rotation180']; ...
                        [{random_rotation270}, 'random_rotation270']]; 
                case 11     % only augmented images
                    augmentation1 = imageDataAugmenter('RandRotation', [90 90]); % Random Rotation
                    augmentation2 = imageDataAugmenter('RandRotation', [180 180]); % Random Rotation
                    augmentation3 = imageDataAugmenter('RandRotation', [270 270]); % Random Rotation
                    
                    random_rotation90 = augment(augmentation1, image);
                    random_rotation180 = augment(augmentation2, image);
                    random_rotation270 = augment(augmentation3, image);
                    
                    augmentedImages = [augmentedImages; ...
                        [{random_rotation90}, 'random_rotation90'];...
                        [{random_rotation180}, 'random_rotation180']; ...
                        [{random_rotation270}, 'random_rotation270']];                    
                otherwise
                    disp("provide a valid option list with options between (0-8) or '9' for all");
            end
        end
  
        % converting the images to greyscale if requested
        if( grayConversion == 1 )
            if( ismatrix( image ) )
                grayImage = rgb2gray(image);
                augmentedImages = [augmentedImages; {grayImage}, 'grayscale'];
            end
        end
        
        % Saving the images into new folder
        for i = 1:1 %length(augmentedImages)
            augmentationName = augmentedImages(i, 2);
            augmentedImage = augmentedImages(i, 1);
            updatedDestination = fullfile( destination, label, strcat(imageName, '___', augmentationName{1},'t30', imageExt) );
            imwrite(augmentedImage{1}, updatedDestination);
        end
        
    end
    
    imdsAug = imageDatastore( destination, 'IncludeSubfolders', true, 'LabelSource', 'foldernames' );

end