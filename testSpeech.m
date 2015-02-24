function loglik  = testSpeech( model ,folder)
%TESTSPEECH Summary of this function goes here
%   Detailed explanation goes here
    addpath('HMMall/');
    [training_signals, test_signals, wordLabel] = load_audio_from_folder(folder);
    mfccs = load_mfcc_from_mat(test_signals);
    for i = 1:length(mfccs), 
        loglik(i) = mhmm_logprob( mfccs{i},model.prior, model.transmat, model.mu, model.sigma, model.mixmat);
    end
end

