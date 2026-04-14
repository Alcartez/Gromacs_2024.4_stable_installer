# GROMACS Stable Setup (On any conda based env)

This repository provides a stable, user-space installation of **GROMACS 2024.4** with **CUDA 11.8** support, specifically designed for DGX servers where system updates frequently break dependencies.

## Steps
- **Clone repo** ``git clone https://github.com/Alcartez/Gromacs_2024.4_stable_installer.git``
- ``cd Gromacs_2024.4_stable_installer``
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

# GROMACS 2024.4 on Kaggle (GPU Accelerated)

This guide explains how to install and run GROMACS 2024.4 with CUDA support on Kaggle using Micromamba.

## 🚀 Quick Start

### 1. Enable GPU Accelerator
In your Kaggle Notebook, go to **Settings** (right sidebar) -> **Accelerator** and select **GPU T4 x2** or **P100**. This is required for the drivers to be visible to GROMACS.

### 2. Clone and Install
Run the following commands in a notebook cell to set up the environment:

```bash
# Clone the installer repository
!git clone [https://github.com/Alcartez/Gromacs_2024.4_stable_installer.git](https://github.com/Alcartez/Gromacs_2024.4_stable_installer.git)
%cd Gromacs_2024.4_stable_installer

# Run the Kaggle-optimized installation script
!bash install_conda_kaggle.sh
```

### 3. Verify GMX version

```bash
!micromamba run -p /opt/micromamba/envs/gmx2024_cuda gmx -version
```

### 4. Run GMX commands

You get the gist

[micromamba run -p /opt/micromamba/envs/gmx2024_cuda] is essential to write before running any gmx command

```bash
!micromamba run -p /opt/micromamba/envs/gmx2024_cuda \
    gmx mdrun -v -deffnm your_file -nb gpu -pme gpu -bonded gpu
```
