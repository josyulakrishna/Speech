function [logliks,labels1] =  fiveModels(models, audio_folder), 
labels1 = [models.name]; 
 
 
    for i=1:length(labels1),
        if strcmp('kA~N',labels1{i}) == 0,
        display('using folder')
        strcat(audio_folder,'/', labels1{i})
        mfccsTest = load_audio_for_test2(strcat(audio_folder,'/', labels1{i}));
        llv = [];
        ranks1  = []; 
        answers = {};
        predicted = {};
        for j = 1:length(mfccsTest), 
            llvt = testSignal2(models,mfccsTest{j});
            [c1, r1] = sort(llvt, 'descend');
            llv = vertcat(llv, llvt);
            t3 = cell2mat(arrayfun(@(x) find(strcmp(x,labels1(r1))), labels1, 'UniformOutput', false));
            ranks1 = vertcat(ranks1, t3);            
            [the_max, index_of_max] = max(llvt);
            answer  =char(models(index_of_max).name);
            answers = vertcat(answers, cellstr(answer));
        end
        logliks.(labels1{i}).llvs = llv;
        logliks.(labels1{i}).ranks = ranks1;
        logliks.(labels1{i}).actual = models(i).name;
        logliks.(labels1{i}).predicted = answers;
        end
    end
    
    
end
 
%[C,index] = sortrows([3,5,6,2]')
%pUnique(index)
 

