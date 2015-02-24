function  y  = getUserSpeech()
%GETUSERSPEECH Summary of this function goes here
%   Detailed explanation goes here
myVoice = audiorecorder(8000, 16, 1);
% Define callbacks to show when
% recording starts and completes.
myVoice.StartFcn = 'disp(''Start speaking.'')';
recordblocking(myVoice, 3);
myVoice.StopFcn = 'disp(''End of recording.'')';
disp('Playing the recording.');
play(myVoice);
y = getaudiodata(myVoice);
plot(y); 
end

