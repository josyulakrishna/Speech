function loglik = testSignal(models, signal, labels)

[mfccs, delta, power] = melfcc(signal);
%size(mfccs)
%size(models)
for i = 1:size(models,2),
    model = models(i);
     loglik(i) = mhmm_logprob( mfccs,model.prior, model.transmat, model.mu, model.sigma, model.mixmat);
end
[the_max, index_of_max] = max(loglik);
fprintf('predicted %s\n',labels{index_of_max});

end

