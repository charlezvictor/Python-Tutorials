#!/bin/bash
# Installs gstack (https://github.com/garrytan/gstack) skills in Claude Code
# cloud sessions, whose home directory is reset when a new container starts.
set -euo pipefail

# Cloud sessions only; on your own machine, install gstack once by hand.
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

GSTACK_DIR="$HOME/.claude/skills/gstack"

# Already installed and set up in this container: nothing to do.
if [ -x "$GSTACK_DIR/setup" ] && [ -x "$GSTACK_DIR/browse/dist/browse" ]; then
  exit 0
fi

# Remove a partial clone left by an earlier failed run.
rm -rf "$GSTACK_DIR"
mkdir -p "$HOME/.claude/skills"
git clone --quiet --single-branch --depth 1 https://github.com/garrytan/gstack.git "$GSTACK_DIR" >&2

# --no-browser: the cloud network blocks gstack's Chromium download.
# Output goes to stderr so it doesn't reach Claude's context.
(cd "$GSTACK_DIR" && ./setup --no-browser --quiet </dev/null) >&2
