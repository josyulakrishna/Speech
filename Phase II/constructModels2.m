function models = constructModels2(mfccs, modellogliks) 
% Takes MFCCs, modellogliklihoods obtained from extractModellogliks and returns Models.
% Get mfccs from extractMfccs and pass it here
% IMPORTANT it has to contain the variable named mfccs in it.
% constructModels -> buildHMM -> trainHMM -> confusionMatrix ->
% extractModelLikelihoods -> constructModels2
    addpath('HMMBuilder'); 
    models = struct();
    labels = fields(modellogliks);
    for i = 1:length(labels), 
        %Build HMM takes MFCCS
            display(labels{i})
            temp = modellogliks.(labels{i}).ranks(:,i);
            n = floor(length(temp)*0.8);
            t = mfccs.(labels{i})(temp(1:n)<5);
            model = buildHMM(t);
            models(i).LL = model.LL;
            models(i).prior = model.prior;
            models(i).transmat = model.transmat; 
            models(i).mu = model.mu;
            models(i).sigma = model.sigma; 
            models(i).mixmat = model.mixmat;
            models(i).name = labels{i};
    end
        
end