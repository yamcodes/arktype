#!/usr/bin/env bash
# Sourced helper: select a Node.js version that satisfies ArkType's
# `engines.node` (>=22.18.0). The base image ships an older `node` earlier on
# PATH, so we activate the nvm-managed default and prepend it explicitly.

export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
# shellcheck disable=SC1091
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Resolve the nvm `default` Node explicitly and put it first on PATH. We base
# this on `nvm which default` (not `nvm which current`) so it stays correct even
# when an older `node` shim is injected at the front of PATH by the base image.
_ark_node_bin="$(dirname "$(nvm which default 2>/dev/null)" 2>/dev/null)"
if [ -n "$_ark_node_bin" ] && [ -x "$_ark_node_bin/node" ]; then
	export PATH="$_ark_node_bin:$PATH"
fi
unset _ark_node_bin

corepack enable >/dev/null 2>&1 || true
