function [models, labels] = constructModels(pathFolder) 
    models = struct();
    d = dir(pathFolder);
    isub = [d(:).isdir]; %# returns logical vector
    nameFolds = {d(isub).name}';
    labels  = {};
    for i = 1:size(nameFolds(3:end), 1), 
            %buildHMM(nameFolds(2+i))
            %display('reading from folder');
            temp = nameFolds(i+2);
            labels{i} = temp;
            model = buildHMM(strcat('Training1/',temp{:}));
            models(i).LL = model.LL;
            models(i).prior = model.prior;
            models(i).transmat = model.transmat; 
            models(i).mu = model.mu;
            models(i).sigma = model.sigma; 
            models(i).mixmat = model.mixmat;
    end
    
    %labels = {'apple', 'banana', 'kiwi', 'lime', 'orange', 'peach', 'pineapple'};
    
end