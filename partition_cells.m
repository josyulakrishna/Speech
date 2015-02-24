function[training, test] = partition_cells(set_of_signals) 
    n = size(set_of_signals,2);
    divide =floor(0.9*n); 
    training = {};
    test  = {};
    
    for i = 1:divide, 
        training{end+1} = set_of_signals{i};
    end
    for i = divide+1:n, 
        test{end+1} = set_of_signals{i};
    end

end