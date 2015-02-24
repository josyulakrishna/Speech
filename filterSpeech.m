function fOut  = filterSpeech( f )
%FILTERSPEECH Summary of this function goes here
%   Detailed explanation goes here
fs = 8000;
N = size(f,1);
df = fs / N;
w = (-(N/2):(N/2)-1)*df;
y = fft(f(:,1), N) / N; %//For normalizing, but not needed for our analysis
y2 = fftshift(y);
figure;
plot(w,abs(y2));
%% Design a bandpass filter that filters out between 700 to 12000 Hz
n = 7;
beginFreq = 500 / (fs/2);
endFreq = 3000 / (fs/2);
[b,a] = butter(n, [beginFreq, endFreq], 'bandpass');
%% Filter the signal
fOut = filter(b, a, f);
%% Construct audioplayer object and play
plot(fOut);
%p = audioplayer(fOut, fs);
%p.play;
end

