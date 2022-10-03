
%Segmentazione basata sul Deep Learning su immagini di fondi retinici 
%con il fine di aggevolare la rilevazione di glaucoma
%
%Basato sul codice scritto dal Dr. Barath Narayanan, 
% University of Dayton Research Institute (UDRI) 
% con co-autori: Dr. Russell C. Hardie e Redha Ali.
% https://blogs.mathworks.com/deep-learning/2021/05/10/semantic-segmentation-for-medical-imaging/?s_tid=feedtopost

% Clear workspace 
clear; close all; clc;

% All images
imds=imageDatastore("RIM-ONE_DL_images",'IncludeSubfolders',true);

% Define class names and their corresponding IDs
classNames=["Optic_Disc","Background"];
labelIDs=[255,0];

% Create a pixelLabelDatastore holding the ground truth pixel labels
pxds=pixelLabelDatastore("GT_Disc",classNames,labelIDs);

% Create a pixel label image datastore of all images  
pximds=pixelLabelImageDatastore(imds,pxds);

% Number of Images
total_num_images=length(pximds.Images);

% Visualize random images
perm = randperm(total_num_images,4);

figure;

% Visualize the images with Mask
for idx=1:length(perm)
    
    [~,filename] = fileparts(pximds.Images{idx});
    subplot(2,2,idx);
    imshow(imread(pximds.Images{perm(idx)}));
    hold on;
    visboundaries(imread(pximds.PixelLabelData{perm(idx)}),'Color','r');
    title(sprintf('%s',filename),'Interpreter',"none");
end

% Desired Image Size 
imageSize=[255 255 3];

% Create a pixel label image datastore of all resized images  
pximdsResz=pixelLabelImageDatastore(imds,pxds,'OutputSize',imageSize);

% Clear all variables except the necessary variables
clearvars -except pximdsResz classNames total_num_images imageSize

% Randomly select 100 images for testing from the dataset
test_idx=randperm(total_num_images,100);

% Rest of the indices are utilize for training and validation 
train_valid_idx=setdiff(1:total_num_images,test_idx);

% Randomly pick 100 images for validation from the training dataset
valid_idx=train_valid_idx(randperm(length(train_valid_idx),100));

% Rest of the indices are used for training
train_idx=setdiff(train_valid_idx,valid_idx);

% Train Dataset
pximdsTrain=partitionByIndex(pximdsResz,train_idx);

% Validation Dataset
pximdsValid=partitionByIndex(pximdsResz,valid_idx);

% Test Dataset
pximdsTest=partitionByIndex(pximdsResz,test_idx);

% Number of classes
numClasses=length(classNames);

% Network
lgraph=deeplabv3plusLayers(imageSize, numClasses,'resnet50');

% Define the parameters for the network 
options=trainingOptions('sgdm',...
    'InitialLearnRate', 0.03, ...
    'Momentum',0.9,...
    'L2Regularization',0.0005,...
    'MaxEpochs',10,...
    'MiniBatchSize',16,...
    'VerboseFrequency',20,...
    'LearnRateSchedule','piecewise',... 
    'ExecutionEnvironment','gpu',...
    'Shuffle','every-epoch',...
    'ValidationData',pximdsValid, ...
    'ValidationFrequency',50, ...
    'ValidationPatience',4,...
    'Plots','training-progress',...
    'GradientThresholdMethod','l2norm',...
    'GradientThreshold',0.05);

% Train the network 
net = trainNetwork(pximdsTrain,lgraph,options);

% Semantic segmentation of test dataset based on the trained network
[pxdspredicted]=semanticseg(pximdsTest,net,'WriteLocation',tempdir);

% Evaluation
metrics=evaluateSemanticSegmentation(pxdspredicted,pximdsTest);

% Normalized Confusion Matrix
normConfMatData=metrics.NormalizedConfusionMatrix.Variables;
figure
h=heatmap(classNames,classNames,100*normConfMatData);
h.XLabel='Predicted Class';
h.YLabel='True Class';
h.Title='Normalized Confusion Matrix (%)';

% Number of Images
num_test_images=length(pximdsTest.Images);

% Pick any random 2 images
perm=randperm(num_test_images,2);

% Visualize the images with Mask
for idx=1:length(perm)
    
    % Extract filename for the title
    [~,filename]=fileparts(pximdsTest.Images{idx});
    
    % Read the original file and resize it for network purposes
    I=imread(pximdsTest.Images{perm(idx)});
    I=imresize(I,[imageSize(1) imageSize(2)],'bilinear');
    
    figure;
    image(I);
    hold on;
    
    % Read the actual mask and resize it for visualization
    actual_mask=imread(pximdsTest.PixelLabelData{perm(idx)});
    actual_mask=imresize(actual_mask,[imageSize(1) imageSize(2)],'bilinear');
    
    % Ground Truth
    visboundaries(actual_mask,'Color','r');
        
    % Predicted by the Algorithm
    predicted_image=(uint8(readimage(pxdspredicted,perm(idx)))); % Values are 1 and 2
    predicted_results=uint8(~(predicted_image-1)); % Conversion to binary and reverse the polarity to match with the labelIds
    
    % Predicted result
    visboundaries(predicted_results,'Color','g');
    title(sprintf('%s Red- Actual, Green - Predicted',filename),'Interpreter',"none");
    
    imwrite(mat2gray(predicted_results),sprintf('%s.png',filename));
    
end
%}
