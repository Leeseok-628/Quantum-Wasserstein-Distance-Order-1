function [dist, H] = W1_dual(sigma, rho)

    N = size(sigma, 1);
    n = floor(log(N)/log(2));
    cvx_begin sdp quiet
    %% Create variables
    variable H(N,N) hermitian
    variable Hi(N/2,N/2,n) hermitian
    %% Objective
    dist = trace(H*(sigma-rho));  %Note: * is dot product
    maximize(dist);
    %% constraints
    subject to
        for i=1:n
            (H - customKron(Hi(:,:,i), i)) <= 0.5.*eye(N);
            (H - customKron(Hi(:,:,i), i)) >= -0.5.*eye(N);
        end
    cvx_end
    H = full(double(H));
%h = H(1,1)
end

%% Testing
%psi1 = zeros(16,1); psi1(1)=1/sqrt(2); psi1(16)=1/sqrt(2);
%psi2 = zeros(16,1); psi2(4)=1/sqrt(2); psi2(13)=1/sqrt(2);
%sigma = psi1*psi1';
%rho = psi2*psi2';