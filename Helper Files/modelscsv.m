function modelscsv( logliks,labels1 )
%MODELS80CSV Summary of this function goes here
%   Detailed explanation goes here
 
names = fieldnames(logliks);
for i=1:length(names), 
    csvwrite_with_headers(strcat( names{i},'.llvs.csv'), logliks.(names{i}).llvs, labels1');
    csvwrite_with_headers(strcat( names{i},'.ranks.csv'), logliks.(names{i}).ranks, labels1');
end
 
end
 

