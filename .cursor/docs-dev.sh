#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

# shellcheck source=/dev/null
. ./.cursor/setup-node.sh

# Serve the ArkType documentation site (Next.js) for local development.
exec pnpm --filter @ark/docs dev
