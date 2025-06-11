# Quantum Wasserstein Distance of Order 1

This repository contains MATLAB code for computing the quantum Wasserstein distance of order 1, as proposed in the paper:

**"The Quantum Wasserstein Distance of Order 1"**  [IEEE Transactions on Information Theory, 2021](https://ieeexplore.ieee.org/document/9420734) by Giacomo De Palma, Milad Marvian, Dario Trevisan, and Seth Lloyd.

The quantum Wasserstein-1 $(W_1)$ distance can be computed in two mathematically equivalent forms:
- Primal form (Definition 6 in the paper)
- Dual form (Proposition 9 in the paper)

## Code Overview

- `W1_primal.m`: Computes the primal formulation of the quantum $W_1$ distance.
- `W1_dual.m`: Computes the dual formulation of the quantum $W_1$ distance. 

## Requirements

- MATLAB R2023a (Update 5)
- [CVX 2.2](http://cvxr.com/cvx/) (Tested with Build 1148)
- [MOSEK 9.1.9](https://www.mosek.com/) (default solver via CVX; Ensure that you have a valid MOSEK license installed)

To install CVX, download it from [cvxr.com/cvx](http://cvxr.com/cvx/), extract it, then run `cd cvx; cvx_setup` in MATLAB.

## Acknowledgements

Special thanks to Quynh Nguyen and Bobak Kiani for sharing the original implementation used in this repository (with permission).
