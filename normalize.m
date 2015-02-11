function nMatrix = normalize( matrix )
%Normalizes a given matrix
%mat = rand(100, 8);
rowsum = sum(matrix,2);
nMatrix = bsxfun(@rdivide, matrix, rowsum);
end

