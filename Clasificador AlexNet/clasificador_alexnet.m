nnet = alexnet;
layers = nnet.Layers;

layers(23)=fullyConnectedLayer(5);
layers(25)=classificationLayer
allImages = imageDatastore('folder','IncludeSubfolders',true,'LabelSource','foldernames');
allImages.ReadFcn = @(loc)imresize(imread(loc),[227,227]);
[trainingImages, testImages] = splitEachLabel(allImages,0.8,'randomize');

opts = trainingOptions('sgdm','InitialLearnRate',0.001,'MaxEpochs',20,'MiniBatchSize',64);
myNet = trainNetwork(trainingImages,layers,opts);

predictedLabels = classify(myNet,testImages);
accurancy = mean(predictedLabels == testImages.Labels)

allImages = imageDatastore('imagenes_test','IncludeSubfolders',true);
allImages.ReadFcn = @(loc)imresize(imread(loc),[227,227]);
for image_index=1:21
    picture = readimage(allImages,image_index);
    label = classify(myNet,picture);
    image(picture);
    title(char(label));
    pause(3);
end
