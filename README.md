# DGX GROMACS Stable Setup

This repository provides a stable, user-space installation of **GROMACS 2024.4** with **CUDA 11.8** support, specifically designed for DGX servers where system updates frequently break dependencies.

## Quick Install
Run this command to build the environment and register the Jupyter kernel:
\`\`\`bash
curl -sSL https://raw.githubusercontent.com/[username]/[repo]/main/setup_gmx.sh | bash
\`\`\`

## Features
- **Micromamba** based (No root required).
- **CUDA 11.8 Runtime** (Compatible with Driver 570+ / CUDA 13.0).
- **Jupyter Integration** (Auto-installs Kernel).
