function x = partialTrace(rho, sys)

% TRX   Partial trace
% requires: nothing
% author: Toby Cubitt
% license: GPL2
%
%    sub = TrX(RHO, SYS) traces out the subsystems specified in
%    vector SYS of state RHO (a densitry matrix).
% E.g. Calling this function on p= a 5-qubit density matrix; sys = [1,5]
%       traces out the first and fifth qubit of the density matrix.

% check arguments
N = length(rho);
n = floor(log(N)/log(2));
if any(sys > n) || any(sys < 1)
  error('Invalid subsystem in SYS')
end
dim = ones(1,n)*2;  % [2,2,...,2]

% calculate systems, dimensions, etc.
rdim = dim(end:-1:1);
keep = [1:n];
keep(sys) = [];
dimtrace = prod(dim(sys));
dimkeep = length(rho)/dimtrace;

  % reshape density matrix into tensor with one row and one column index
  % for each subsystem, permute traced subsystem indices to the end,
  % reshape again so that first two indices are row and column
  % multi-indices for kept subsystems and third index is a flattened index
  % for traced subsystems, then sum third index over "diagonal" entries
  perm = n+1-[keep(end:-1:1),keep(end:-1:1)-n,sys,sys-n];
  x = reshape(permute(reshape(rho,[rdim,rdim]),perm),...
              [dimkeep,dimkeep,dimtrace^2]);
  x = sum(x(:,:,[1:dimtrace+1:dimtrace^2]),3);

end