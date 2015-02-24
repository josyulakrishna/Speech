function [ output_args ] = godMode( models, labels )
%GODMODE Summary of this function goes here
%   Detailed explanation goes here
addpath('silenceRemoval/');
y = getUserSpeech();
wavwrite(y, 'signal.wav');
[segments, fs] = detectVoiced('signal.wav',1);
disp('found total segments');
size(segments)
filteredSignal  = filterSpeech(segments{1});
testSignal(models, filteredSignal, labels); 
end

