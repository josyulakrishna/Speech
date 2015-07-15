function logliks =  extractModelsLikelihoods3(models, modellogliks, mfccs), 
%Extracts loglikelihoods from impure models with upto 5th best word ranks.
%constructModels -> buildHMM -> trainHMM -> confusionMatrix ->
%extractModelLikelihoods -> constructModels2 -> buildHMM -> trainHMM ->
%extractModelLikelihoods3 
addpath('Testing');
labels1 = {models.name};
l = fields(modellogliks);
   for i=1:length(labels1),
        display(strcat('processing/', labels1{i}));
        temp = modellogliks.(labels1{i}).ranks(:,find(strcmp(l, labels1{i})));
        mfccsTest = mfccs.(labels1{i})(temp<5);
        length(mfccsTest)
        llv = [];
        ranks1  = []; 
        answers = {};
        predicted = {};
        for j = 1:length(mfccsTest),
            llvt = testSignal2(models,mfccsTest{j});
            [c1, r1] = sort(llvt, 'descend');
            llv = vertcat(llv, llvt);
            t3 = cell2mat(arrayfun(@(x) find(strcmp(x,labels1(r1))), labels1, 'UniformOutput', false));
            ranks1 = vertcat(ranks1, t3);            
        end
        logliks.(labels1{i}).llvs = llv;
        logliks.(labels1{i}).ranks = ranks1;
    end
end

 
%[C,index] = sortrows([3,5,6,2]')
%pUnique(index)
 

