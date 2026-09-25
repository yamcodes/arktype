#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

# shellcheck source=/dev/null
. ./.cursor/setup-node.sh

echo "Using node $(node -v) and pnpm $(pnpm -v)"

pnpm install --frozen-lockfile

# Build the library packages so `arktype`'s default (built) exports resolve for
# consumers like the docs site. Runtime tests use the `ark-ts` source condition
# and don't require this, but the docs app and default imports do.
pnpm build
