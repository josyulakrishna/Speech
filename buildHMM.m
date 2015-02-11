function model = buildHMM(folder)
%folder = path to training folder

[audio, wordLabel] = load_audio_from_folder(folder);
mfccs = load_mfcc_from_mat(audio);
%Construct HMM's on the words
[LL, prior1, transmat1, mu1, Sigma1, mixmat1] = constructHMM(mfccs);
model = struct; 
model.LL = LL;
model.prior = prior1;
model.transmat = transmat1; 
model.mu = mu1; 
model.sigma = Sigma1; 
model.mixmat = mixmat1;
end

