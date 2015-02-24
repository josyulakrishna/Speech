function [training_audio_signals, test_audio_signals, word_labels] = load_audio_from_folder(audio_folder)
    %Give path to the audio folder, returns, signals and labels Path to the Audio folde
    audio_signals = {};
    word_labels = {};
    %dir(audio_folder)
    for word_folder = struct2cell(dir(audio_folder)),
        for word_file = struct2cell(dir(sprintf('%s/%s/*.wav', audio_folder, char(word_folder(1))))),
            file_path = sprintf('%s/%s/%s', audio_folder, char(word_folder(1)), char(word_file(1)));
             audio_signals(end + 1) = {wavread(file_path)}; %#ok<AGROW>
             word_labels(end + 1) = word_folder(1); %#ok<AGROW>
        end
    end

    training_audio_signals = {};
    test_audio_signals = {}; 
    
    n = floor(0.8*size(audio_signals, 2));
    
    for i = 1:n, 
      training_audio_signals(end+1) = audio_signals(i);
    end
     
     for i = n+1:size(audio_signals,2), 
       test_audio_signals(end+1) = audio_signals(i);
     end
        
end