function [actualLabels1, predictedLabels1] = confusionMatrix2(models,mfccs,mode1)
%Before running this module load models into the environment and the mffcs
%confusionMatrix -> test -> testSpeech
%Tests on the data as 20% test set on the 80% data. Use this prefferably instead of
%confusionMatrix

 addpath(genpath('HMMall'));
 actualLabels1 = [];
 predictedLabels1 = [];
 labels = {models.name}';
 if nargin<3, 
     mode1 = 'hmm';
 end
 for i=1:size(labels),
     display(strcat(' processing ','/', labels(i)))
     temp = mfccs.(labels{i});
     temp = temp( floor(length(temp)*.8)+1: length(temp));
     actualLabels1  = vertcat(actualLabels1, repmat(  labels(i) , length(temp), 1)); 
     predictedLabels1 = vertcat(predictedLabels1, test(models, temp, mode1) );
 end
end