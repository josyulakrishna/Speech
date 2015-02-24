function [LL, prior1, transmat1, mu1, Sigma1, mixmat1] = constructHMM(mfcc)
addpath(genpath('HMMall'));
%addpath('rastamat');
%rmpath('mfcc')
%load('mfcc.mat');
Tw = 25;           % analysis frame duration (ms)
Ts = 10;           % analysis frame shift (ms)
alpha = 0.97;      % preemphasis coefficient
R = [ 0 4000 ];  % frequency range to consider
M = 20;            % number of filterbank channels 
C = 13;            % number of cepstral coefficients
L = 0.6;            % cepstral sine lifter parameter
Q = 3;             % Number of states (left to right)
f_bank = 40;       % number of filterbank channels 
O = 13;             %output symbols
mix = 1;
%Training HMM using EM algorithm
%[speech, fs, nbits ] = wavread('apple/apple01.wav');
%[MFCC, FBE, frames ] = mfcc( speech, fs, Tw, Ts, alpha, 'hamming', R, f_bank, C, L );
cov_type = 'full'; %the covariance type that is chosen as ҦullҠfor gaussians.
prior0 = normalise(rand(Q,1));
transmat0 = mk_stochastic(rand(Q,Q));
%size(MFCC)
mfccs = cell2mat(mfcc); 
display('size of mfccs');
%size(mfccs)
[mu0, Sigma0] = mixgauss_init(Q*mix, cell2mat(mfcc), cov_type);

mu0 = reshape(mu0, [O Q mix]);
Sigma0 = reshape(Sigma0, [O O Q mix]);
mixmat0 = mk_stochastic(rand(Q,mix));
[LL, prior1, transmat1, mu1, Sigma1, mixmat1] = mhmm_em(cell2mat(mfcc), prior0, transmat0, mu0, Sigma0, mixmat0, 'max_iter', 100);

end

