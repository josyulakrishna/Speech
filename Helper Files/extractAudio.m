function audio_signals = extractAudio(audio_folder)
    %Give path to the audio folder, returns, signals and labels Path to the Audio folde
    audio_signals = {};
    for word_folder = struct2cell(dir(audio_folder)),
        for word_file = struct2cell(dir(sprintf('%s/%s/*.wav', audio_folder, char(word_folder(1))))),
            %file_path = sprintf('%s/%s/%s', audio_folder, char(word_folder(1)), char(word_file(1)))
            file_path = sprintf('%s/%s', audio_folder, char(word_file(1)));
             audio_signals(end + 1) = {wavread(file_path)}; %#ok<AGROW>
        end
    end
end