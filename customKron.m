function x = customKron(Hi, i)
    %    x = customKron(Hi, i) computes the tensor product 
    %           of H_i (an operator that does not act
    %           on qubit i) and I_i (the identity on qubit i)
    %    Hi should be a square 2^n by 2^n matrix
    %    i should be a positive integer no larger than n+1
    %    This function returns a (n+1)-qubit operator

    % check arguments
    N = length(Hi);
    n = floor(log(N)/log(2));
    if i > (n+1) || i < 1
      error('Invalid subsystem')
    end

    % tensor product with identity over last dimension
    tensor_prod = kron(Hi,eye(2));

    dim = ones(1,n+1)*2;  % [2,2,...,2]

    % reshape Hi into 
    % Each subsystem gets one index for its row and another one for its column
    % Note: Reshape indices in Matlab is B(i_n,...,i_2,i_1,j_n,...,j_1) = A(i,j)
    reshaped1 = reshape(tensor_prod,[dim, dim]);

    % Move the added subsystem to the i-th qubit place
    idx = [[2:n-i+2],[1],[n-i+3:n+1],[n+3:2*n-i+3],[n+2],[2*n-i+4:2*n+2]];
    reshaped2 = permute(reshaped1, idx);
    % Reshape to desired operator
    x = reshape(reshaped2, [2^(n+1),2^(n+1)]);
end