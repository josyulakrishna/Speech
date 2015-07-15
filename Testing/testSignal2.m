function logliks = testSignal2(models, signal),
%returns the loglikelihood of a signal and the labels 
%size(mfccs)
%size(models)
addpath(genpath('HMMall'));
for i = 1:size(models,2),
        model = models(i);
        loglik(i).value = mhmm_logprob( signal ,model.prior, model.transmat, model.mu, model.sigma, model.mixmat);
        %loglik(i).name = model.name; 
end

logliks = [loglik.value];
%labels = [loglik.name];

end

