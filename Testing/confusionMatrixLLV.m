function [actualLabels, predictedLabels] = confusionMatrixLLV(models, logliks)
%Before running this module load models into the environment and the mffcs
%confusionMatrix -> test -> testSpeech
 addpath(genpath('HMMall'));
 actualLabels = [];
 predictedLabels = [];
 labels = fields(logliks);
 for i=1:size(labels),
     display(strcat(' processing ','/', labels(i)))
     temp = logliks.(labels{i}).llvs;
     n = floor(length(temp)*0.8);
     actualLabels  = vertcat(actualLabels, repmat( labels(i),length(temp)-n+1, 1)); 
     for j=1:length(temp)-n+1,
        predictedLabels = vertcat(predictedLabels, test(models, logliks.(labels{i}).llvs(j,:), 'llv'));
     end
 end
end