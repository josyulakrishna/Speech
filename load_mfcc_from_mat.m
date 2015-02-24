function mfcc =  load_mfcc_from_mat(audio)
    %load(pathtomat)
    addpath('rastamat')
    mfcc = {};
    for i = 1:length(audio), 
        if size(audio{i}, 1) > 0,
            mfcc(end+1) = mat2cell(melfcc(cell2mat(audio(i))));
        end
    end
end