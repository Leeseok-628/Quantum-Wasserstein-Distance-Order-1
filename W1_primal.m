function dist = W1_primal(sigma, rho)
    N = size(sigma, 1);
    n = floor(log(N)/log(2));
    cvx_begin sdp
    %% Create variables
    variable sigmas(N,N,n) complex semidefinite %This already includes hermitian
    variable rhos(N,N,n) complex semidefinite   %See http://cvxr.com/cvx/doc/basics.html
    %% Objective
    dist = 0;
    for i=1:n
        dist = dist + trace(sigmas(:,:,i));
    end
    minimize(dist);
    %% constraints
    subject to
        sigma - rho == sum(sigmas,3)-sum(rhos,3);
        for i=1:n
            partialTrace(sigmas(:,:,i), [i]) -  partialTrace(rhos(:,:,i), [i])==0;
        end
    cvx_end
end
