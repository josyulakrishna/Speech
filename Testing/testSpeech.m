function loglik  = testSpeech( model ,mfccs, mode1)
%TESTSPEECH Summary of this function goes here
%   Detailed explanation goes here
%     returns the loglikelihood for a test utterance
%     mfccs = load_mfcc_from_mat(test_signals);
%   confusionMatrix -> test -> testSpeech
if mode1 == 'hmm'
    for i = 1:length(mfccs), 
        loglik(i) = mhmm_logprob(mfccs{i},model.prior, model.transmat, model.mu, model.sigma, model.mixmat);
    end
end
if mode1 == 'llv'
    loglik = mhmm_logprob(mfccs',model.prior, model.transmat, model.mu, model.sigma, model.mixmat);
end
end

