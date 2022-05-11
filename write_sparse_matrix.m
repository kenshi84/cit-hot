function write_sparse_matrix(A, filename)
    [row col v] = find(A)
    % Convert indices to zero-based
    row = row - 1;
    col = col - 1;
    dlmwrite(filename,[row col v], 'delimiter', '\t')
end
