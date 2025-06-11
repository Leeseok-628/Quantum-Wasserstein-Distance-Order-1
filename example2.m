% Example 2: W1 distance between |000> and GHZ state

% |000>
ket_000 = zeros(8,1); ket_000(1) = 1;

% GHZ state = (|000> + |111>)/sqrt(2)
ket_111 = zeros(8,1); ket_111(8) = 1;
ket_ghz = (ket_000 + ket_111) / sqrt(2);

% Define density matrices
rho = ket_000 * ket_000';   % |000><000|
sigma = ket_ghz * ket_ghz'; % GHZ * GHZ†

% Compute W1 distances
d_primal = W1_primal(sigma, rho);
d_dual = W1_dual(sigma, rho);

fprintf('W1 distance (primal): %.4f\n', d_primal);
fprintf('W1 distance (dual):   %.4f\n', d_dual);
