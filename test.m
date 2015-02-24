function answers = test( models,folder, labels )
%TEST Summary of this function goes here
%   Detailed explanation goes here
%folder
   values = struct();
   tester = [];
   answers = [];
   for i = 1:size(models,2), 
        values(i).loglik = testSpeech(models(i),folder); 
   end
   
   for i = 1:size(values,2),
       tester = horzcat(tester,reshape(values(i).loglik,size(values(i).loglik,2),size(values(i).loglik,1)));
   end
   
   for i = 1:size(tester,1),
      [the_max, index_of_max] = max(tester(i,:));
      answer  = char(labels{index_of_max});
      answers = horzcat(answers, cellstr(answer));
   end
   
end

