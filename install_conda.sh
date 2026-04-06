#!/bin/bash

# Ensure we are in the home directory for installations
cd $HOME

echo "------------------------------------------------"
echo " Select a Conda-compatible Manager to install:"
echo " (All options support your GROMACS environment.yml)"
echo "------------------------------------------------"
echo " 1) Micromamba (Lightweight, Single-binary, FAST - Recommended)"
echo " 2) Mamba      (Fast C++ rewrite of Conda via Mambaforge)"
echo " 3) Miniconda  (The lightweight standard)"
echo " 4) Anaconda   (The full Data Science suite - Very Heavy)"
echo "------------------------------------------------"
read -p "Enter choice [1-4]: " choice

case $choice in
    1)
        echo "Installing Micromamba..."
        "${SHELL}" <(curl -L micro.mamba.pm/install.sh)
        # Force a refresh of the shell for the current session
        export PATH="$HOME/.local/bin:$PATH"
        eval "$(micromamba shell hook --shell bash)"
        ;;
    2)
        echo "Installing Mamba (Mambaforge)..."
        curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh"
        bash Mambaforge-Linux-x86_64.sh -b -p $HOME/mambaforge
        $HOME/mambaforge/bin/conda init bash
        rm Mambaforge-Linux-x86_64.sh
        ;;
    3)
        echo "Installing Miniconda..."
        curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
        bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda3
        $HOME/miniconda3/bin/conda init bash
        rm Miniconda3-latest-Linux-x86_64.sh
        ;;
    4)
        echo "Installing Anaconda..."
        curl -O https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh
        bash Anaconda3-2024.02-1-Linux-x86_64.sh -b -p $HOME/anaconda3
        $HOME/anaconda3/bin/conda init bash
        rm Anaconda3-2024.02-1-Linux-x86_64.sh
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo "------------------------------------------------"
echo "INSTALLATION FINISHED."
echo "NEXT STEPS:"
echo "1. Run: source ~/.bashrc"
echo "2. Run: micromamba create -f environment.yml (or 'conda env create...')"
echo "------------------------------------------------"
