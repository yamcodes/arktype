#!/usr/bin/env bash
# Sourced helper: select a Node.js version that satisfies ArkType's
# `engines.node` (>=22.18.0). The base image ships an older `node` earlier on
# PATH, so we activate the nvm-managed default and prepend it explicitly.

export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

nvm use default >/dev/null 2>&1 || true
export PATH="$(dirname "$(nvm which current 2>/dev/null || command -v node)"):$PATH"

corepack enable >/dev/null 2>&1 || true
