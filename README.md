# Quantum Wasserstein Distance of Order 1

This repository contains MATLAB code for computing the quantum Wasserstein distance of order 1, as proposed in the paper:

**"The Quantum Wasserstein Distance of Order 1"**  
[IEEE Transactions on Information Theory, 2021](https://ieeexplore.ieee.org/document/9420734)  
Giacomo De Palma, Milad Marvian, Dario Trevisan, Seth Lloyd.

The quantum Wasserstein-1 $(W_1)$ distance can be computed in two mathematically equivalent forms:
- Primal form (Definition 6 in the paper)
- Dual form (Proposition 9 in the paper)

## Code Overview

- `W1_primal.m`: Computes the primal formulation of the quantum $W_1$ distance.
- `W1_dual.m`: Computes the dual formulation using a semidefinite program (SDP) via CVX.

## Requirements
