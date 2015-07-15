function [actualLabels, predictedLabels] = confusionMatrix(models, mfccs)
%Before running this module load models into the environment and the mffcs
%confusionMatrix -> test -> testSpeech
 addpath(genpath('HMMall'));
 actualLabels = [];
 predictedLabels = [];
 labels = fields(mfccs);
 for i=1:size(labels),
     display(strcat(' processing ','/', labels(i)))
     actualLabels  = vertcat(actualLabels, repmat( labels(i),21, 1)); 
     predictedLabels = vertcat(predictedLabels, test(models, mfccs.(labels{i})(end-20:end), 'hmm'));
 end
end