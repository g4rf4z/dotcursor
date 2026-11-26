#!/bin/bash
# Runs the project's ESLint on the file Claude just edited and sends the errors back to Claude.

# Skip projects without ESLint.
eslint="$CLAUDE_PROJECT_DIR/node_modules/.bin/eslint"
[ -x "$eslint" ] || exit 0

# Skip files that ESLint does not check.
file=$(jq -r '.tool_input.file_path')
case "$file" in
  *.js|*.jsx|*.mjs|*.cjs|*.ts|*.tsx|*.vue) ;;
  *) exit 0 ;;
esac

cd "$CLAUDE_PROJECT_DIR" || exit 0
"$eslint" --no-warn-ignored "$file" 1>&2 || exit 2
