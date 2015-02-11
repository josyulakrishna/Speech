function loglik  = testSpeech( model ,folder)
%TESTSPEECH Summary of this function goes here
%   Detailed explanation goes here
    addpath('HMMall/');
    [audio, wordLabel] = load_audio_from_folder(folder);
    mfccs = load_mfcc_from_mat(audio);
    for i = 1:length(mfccs), 
        loglik(i) = mhmm_logprob( mfccs{i},model.prior, model.transmat, model.mu, model.sigma, model.mixmat);
    end
end

