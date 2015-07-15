function models = constructModels(mfccs) 
% Takes MFCCs and returns Models. Get mfccs from extractMfccs and save into
% a mat file and give it here.
%IMPORTANT it has to contain the variable named mfccs in it.
%constructModels -> buildHMM -> trainHMM
    addpath('HMMBuilder'); 
    
    models = struct();
    labels = fields(mfccs);
    for i = 1:length(labels), 
        %Build HMM takes MFCCS
            display(labels{i})
            model = buildHMM(mfccs.(labels{i})(1:end-20));
            models(i).LL = model.LL;
            models(i).prior = model.prior;
            models(i).transmat = model.transmat; 
            models(i).mu = model.mu;
            models(i).sigma = model.sigma; 
            models(i).mixmat = model.mixmat;
            models(i).name = labels{i};
    end
        
end