% Example 1: W1 distance between |000> and |111>

% Define basis vectors
ket_000 = zeros(8,1); ket_000(1) = 1;
ket_111 = zeros(8,1); ket_111(8) = 1;

% Define density matrices
rho = ket_000 * ket_000';   % |000><000|
sigma = ket_111 * ket_111'; % |111><111|

% Compute W1 distances
d_primal = W1_primal(sigma, rho);
[d_dual, H] = W1_dual(sigma, rho);

fprintf('W1 distance (primal): %.4f\n', d_primal);
fprintf('W1 distance (dual):   %.4f\n', d_dual);
