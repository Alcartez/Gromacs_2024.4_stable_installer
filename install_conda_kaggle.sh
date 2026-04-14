#!/bin/bash
set -e 

echo "Installing Micromamba..."
curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba
mv bin/micromamba /usr/local/bin/micromamba

export MAMBA_ROOT_PREFIX=/opt/micromamba

# --- THE FIX FOR THE CUDA ERROR ---
# This forces the solver to recognize CUDA 11.8 exists on the Kaggle machine
export CONDA_OVERRIDE_CUDA="11.8"

echo "Creating GROMACS environment..."
micromamba create -y -f environment.yml

echo "DONE."
