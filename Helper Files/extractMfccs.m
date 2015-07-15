function mfccs =  extractMfccs(folder), 

temp = dir(folder); 
fileNames = {temp.name};
audioSignals = struct; 
mfccs = struct;
for i=5:length(fileNames),
    display(fileNames{i});
     audioSignals.( strrep(fileNames{i}, '~', '_') )= extractAudio(strcat(folder, '/', fileNames{i}));
     mfccs.( strrep(fileNames{i}, '~', '_') ) = load_mfcc_from_mat(audioSignals.( strrep(fileNames{i}, '~', '_') ));
end

end

