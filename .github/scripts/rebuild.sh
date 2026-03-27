#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for wasmCloud/wasmcloud.com
# Runs on existing source tree (no clone). Installs deps, runs pre-build steps, builds.
# Docusaurus 3.8.0, npm workspaces, Node 20+

# --- Node version ---
NODE_VERSION="20"
export NVM_DIR="${HOME}/.nvm"
if [ ! -f "${NVM_DIR}/nvm.sh" ]; then
    curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi
source "${NVM_DIR}/nvm.sh"
nvm install "${NODE_VERSION}"
nvm use "${NODE_VERSION}"

echo "Node version: $(node --version)"
echo "npm version: $(npm --version)"

# --- Package manager + dependencies ---
npm install

# --- Build ---
npm run build

echo "[DONE] Build complete."
