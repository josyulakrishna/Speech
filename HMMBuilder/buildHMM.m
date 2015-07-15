function model = buildHMM(mfccsOfSyllable, mode1),
%Input from constructModels takes MFCCS of syllable trains a model in
%constructHmm.
    if nargin<2, 
        mode1 = 'hmm';
    end
    [LL, prior1, transmat1, mu1, Sigma1, mixmat1] = trainHMM(mfccsOfSyllable, mode1);
    model = struct; 
    model.LL = LL;
    model.prior = prior1;
    model.transmat = transmat1; 
    model.mu = mu1; 
    model.sigma = Sigma1; 
    model.mixmat = mixmat1;
end

