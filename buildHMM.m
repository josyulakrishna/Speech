function model = buildHMM(folder)
%folder = path to training folder
[training_audio_signals, test_audio_signals, word_labels] = load_audio_from_folder(folder);
%[audio, wordLabel] = load_audio_from_folder(folder);
%display('size of audio signals');
%size(audio)
mfccs = load_mfcc_from_mat(training_audio_signals);
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

