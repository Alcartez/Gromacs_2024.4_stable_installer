# DGX GROMACS Stable Setup

This repository provides a stable, user-space installation of **GROMACS 2024.4** with **CUDA 11.8** support, specifically designed for DGX servers where system updates frequently break dependencies.

## Steps
- **Install Conda Engine** using ``bash install_conda.sh``
- **Use the Conda Engine to initiate the environment**
For Micromamba
``micromamba create -f environment.yml``
For Miniconda, Anaconda or Mamba
``conda env create -f environment.yml``

Explicit Environment is added just in case anything breaks.

## Features
- **Conda** based (No root required).
- **CUDA 11.8 Runtime** (Compatible with Driver 570+ / CUDA 13.0).
- **Jupyter Integration** (Auto-installs Kernel).
