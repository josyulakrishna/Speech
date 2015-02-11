function models = constructModels(pathFolder) 
    models = struct();
    d = dir(pathFolder);
    isub = [d(:).isdir]; %# returns logical vector
    nameFolds = {d(isub).name}';
    for i = 1:size(nameFolds(3:end), 1), 
            %buildHMM(nameFolds(2+i))
            temp = nameFolds(i+2);
            model = buildHMM(strcat('Training/',temp{:}));
            models(i).LL = model.LL;
            models(i).prior = model.prior;
            models(i).transmat = model.transmat; 
            models(i).mu = model.mu;
            models(i).sigma = model.sigma; 
            models(i).mixmat = model.mixmat;
    end,
    labels = ['apple', 'banana', 'kiwi', 'lime', 'orange', 'peach', 'pineapple'];
end