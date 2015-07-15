function llvModels = makeLLVllvModels(logliks),
%takes log
%makeLLVModels -> buildHMM -> trainHMM
addpath('HMMBuilder'); 
labels = fields(logliks); 
llvllvModels = struct(); 
for i = 1:length(labels), 
        %Build HMM takes MFCCS
            display(labels{i});
            %size(logliks.(labels{i}).llvs(1:end-20,:))
            temp = logliks.(labels{i}).llvs;
            n = floor(length(temp)*0.8); 
            model = buildHMM( temp(1:n,:), 'llv');
            llvModels(i).LL = model.LL;
            llvModels(i).prior = model.prior;
            llvModels(i).transmat = model.transmat; 
            llvModels(i).mu = model.mu;
            llvModels(i).sigma = model.sigma; 
            llvModels(i).mixmat = model.mixmat;
            llvModels(i).name = labels{i};
    end
end