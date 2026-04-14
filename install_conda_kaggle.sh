#!/bin/bash
set -e 

# 1. Setup paths (Using /kaggle/working allows for persistence if needed)
export MAMBA_ROOT_PREFIX=/kaggle/working/micromamba
export BIN_DEST=/usr/local/bin

echo "--- Installing Micromamba ---"
curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba
chmod +x bin/micromamba
mv bin/micromamba $BIN_DEST/micromamba

# 2. Initialize shell (Crucial for 'micromamba activate' to work later)
micromamba shell init -s bash -p $MAMBA_ROOT_PREFIX
source ~/.bashrc

echo "--- Creating GROMACS environment ---"
# -p specifies the path directly, which is often easier on Kaggle
micromamba create -y -p $MAMBA_ROOT_PREFIX/envs/gromacs -f environment.yml

echo "--- Installation Finished ---"
