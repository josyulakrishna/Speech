function answers = test( models, mfccs, mode1 )
% This function tests the models agianst the mfccs passed and returns the
% labels of the predicted model
% confusionMatrix -> test -> testSpeech
   labels = {models.name};
   values = struct();
   tester = [];
   answers = [];
   for i = 1:length(models), 
        values(i).loglik = testSpeech(models(i),mfccs, mode1); 
   end
   for i = 1:size(values,2),
       tester = horzcat(tester,reshape(values(i).loglik,size(values(i).loglik,2),size(values(i).loglik,1)));
   end
   
   for i = 1:size(tester,1),
      [the_max, index_of_max] = max(tester(i,:));
      answer  = char(models(index_of_max).name);
      answers = vertcat(answers, cellstr(answer));
   end
   
end

