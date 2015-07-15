function [trainingMfccs, testingMfccs,wordlabels ] = saveMFCC(folder), 
[training, test, wordlabels] = load_audio_from_folder(folder); 
trainingMfccs = load_mfcc_from_mat(training); 
testingMfccs = load_mfcc_from_mat(test); 
end