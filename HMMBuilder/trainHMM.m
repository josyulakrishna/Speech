function [LL, prior2, transmat2, mu2, Sigma2, mixmat2] = trainHMM(mfcc,mode1,numberOfModelsLLV)
%constructModels/makeLLVModels -> buildHMM -> trainHMM
addpath(genpath('HMMall'));
if nargin < 2 
    mode1 = 'hmm' ;
end
if strcmp(mode1,'hmm')
    size(mfcc)
    Q = 3;             % Number of states (left to right)
    O = 13;             %output symbols
    mix = 2;
    cov_type = 'full'; %the covariance type that is chosen as ?ull?for gaussians.
    prior1 = [1;0;0];
    transmat1 = mk_stochastic(triu(rand(Q,Q)));
    transmat1
    temp = cell2mat(mfcc);
    [mu1, Sigma1] = mixgauss_init(Q*mix, temp, cov_type);
    mu1 = reshape(mu1, [O Q mix]);
    Sigma1 = reshape(Sigma1, [O O Q mix]);
    mixmat1 = mk_stochastic(rand(Q,mix));
    [LL, prior2, transmat2, mu2, Sigma2, mixmat2] = mhmm_em(mfcc, prior1, transmat1, mu1, Sigma1, mixmat1, 'max_iter', 100);
end

if strcmp(mode1, 'llv')
    Q = 1;             % Number of states (left to right)
    O = numberOfModelsLLV;             %output symbols
    mix = 2;
    cov_type = 'full'; %the covariance type that is chosen as ?ull?for gaussians.
    prior0 = [1];
    transmat0 = mk_stochastic(rand(Q,Q));
    [mu0, Sigma0] = mixgauss_init(Q*mix, mfcc', cov_type);
    mu0 = reshape(mu0, [O Q mix]);
    Sigma0 = reshape(Sigma0, [O O Q mix]);
    mixmat0 = mk_stochastic(rand(Q,mix));
    [LL, prior2, transmat2, mu2, Sigma2, mixmat2] = mhmm_em(mfcc', prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', 70);
end
end

