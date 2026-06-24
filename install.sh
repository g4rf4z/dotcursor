#!/usr/bin/env bash
set -euo pipefail

REPO="https://github.com/g4rf4z/dotcursor.git"
TARGET=".cursor"

TMP=$(mktemp -d)
NEW="${TARGET}.new.$$"
trap 'rm -rf "$TMP" "$NEW"' EXIT

git clone --quiet --depth 1 "$REPO" "$TMP"

COMMIT=$(git -C "$TMP" rev-parse --short HEAD)
DATE=$(date +%Y-%m-%d)

mkdir -p "$NEW"
cp -r "$TMP/rules" "$NEW/rules"
cp -r "$TMP/.cursor-plugin" "$NEW/.cursor-plugin"
echo "$COMMIT ($DATE)" > "$NEW/.version"

rm -rf "$TARGET"
mv "$NEW" "$TARGET"

echo "✓ .cursor updated to $COMMIT"
