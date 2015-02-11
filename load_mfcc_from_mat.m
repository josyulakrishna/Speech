function mfcc =  load_mfcc_from_mat(audio)
    %load(pathtomat)
    addpath('rastamat')
    mfcc = {};
    for i = 1:length(audio), 
        mfcc(end+1) = mat2cell(melfcc(cell2mat(audio(i))));
    end
end