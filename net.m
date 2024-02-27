%Creating a datastore
imds = imageDatastore('', 'IncludeSubfolders', true, 'LabelSource', 'foldernames');
imds.ReadFcn = @(filename)imresize(im2double(imread(filename)), [256, 256]);
disp(imds);

%Step 2
%Splitting the data
[traindata,testdata] = splitEachLabel(imds,0.8);

%Step 3
layer = [
    imageInputLayer([256 256 3])
    convolution2dLayer(5,20)    
    reluLayer
    maxPooling2dLayer(2, 'Stride', 2)
    fullyConnectedLayer(4) 
    softmaxLayer
    classificationLayer
];

% Step 4
% Training options
options = trainingOptions('rmsprop', ...
    'Plots', 'training-progress', ...
    'LearnRateSchedule', 'piecewise', ...
    'MaxEpochs', 30, ...
    'LearnRateDropFactor', 0.4, ...
    'LearnRateDropPeriod', 7, ...
    'MiniBatchSize', 300);

% Step 5
% Training the network
[net1, info] = trainNetwork(traindata, layer, options);

% Step 6: Evaluate accuracy on test data
predictedLabels = classify(net1, testdata);
actualLabels = testdata.Labels;
accuracy = sum(predictedLabels == actualLabels) / numel(actualLabels);
disp(['Accuracy: ', num2str(accuracy * 100), '%']);

save net net1

% Training completed
helpdlg('Training completed');