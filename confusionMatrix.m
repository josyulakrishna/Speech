function [actualLabels, predictedLabels] = confusionMatrix(models, testFolder, labels)
 subfolders = ListSubFolders(testFolder); 
 actualLabels = [];
 predictedLabels = [];
 for i=1:size(subfolders, 1), 
     temp = subfolders(i);
     actualLabels  = horzcat(actualLabels, repmat(cellstr(temp) ,1, 3)); 
     folder = strcat(strcat(testFolder,'/'), subfolders(i));
     predictedLabels = horzcat(predictedLabels, test(models, folder{:}, labels) );
 end
end