warning('off', 'all');

addpath('HMM'); 
addpath('Phase I');
addpath('Phase II');
addpath('Phase III');
addpath('Testing'); 

%Change the number of States of the HMM here and the Mixture Components. 
%Possible errors: Number of Centers exceed the data dimension, in which
%case try decreasing the mixture components, if that still doesn't work 
%check the dimesions of your data. 

numOfStates = 3; 
numOfMixtures = 2;

%Path to the MFCCS file should be given here. Extract MFCCS using the
%extractMfccs Function and save the result in a mat file. 

pathToMfccsMatFile = 'femaleMfcc.mat'; 

%This Function constructs the HMM Models with 13 Mfcc Coefficients with
%that are obtained from the extractMfccs.
load('femaleMfcc.mat', 'mfccs');

models = constructModels(mfccs);

save(str('models.mat', date), 'models');

%construct confusion matrix for the given data
[actualLabels, predictedLabels] = confusionMatrix(models, mfccs, mode1);
C = confusionmat(actualLabels, predictedLabels); 
cS = confusionmatStats(C'); 

%choose models you want to test on 15 is better. 
numberofmodels = 5;

[values, index] = sort(cS.precision, 'descend'); 

modelTop = models(index(1:numberofmodels)); 

modellogliks =  extractModelsLikelihoods(modelTop, mfccs);

%models with only top 5 samples
revisedModels = constructModels2( mfccs, modellogliks); 

%extracting the new features
modellogliks2 = extractModelsLikelihoods3( revisedModels, modellogliks, mfccs);

%training the HMM with new features
modelsWithNewFeatures = makeLLVModels( modellogliks2 );

%testing the models
[actual, predicted] = confusionMatrixLLV(mfccs, modelsWithNewFeatures); 
