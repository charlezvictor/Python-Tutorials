#!/bin/bash
# Installs gstack (https://github.com/garrytan/gstack) skills in Claude Code
# cloud sessions, whose home directory is reset when a new container starts.
# The browser download needs cdn.playwright.dev in the environment's allowed hosts.
set -euo pipefail

# Cloud sessions only; on your own machine, install gstack once by hand.
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

GSTACK_DIR="$HOME/.claude/skills/gstack"

# Full Chromium that gstack's Playwright version uses (empty if not resolvable).
chromium_path() {
  (cd "$GSTACK_DIR" && node -e "process.stdout.write(require('playwright').chromium.executablePath())") 2>/dev/null || true
}

installed() {
  [ -x "$GSTACK_DIR/setup" ] && [ -x "$GSTACK_DIR/browse/dist/browse" ] || return 1
  local chrome
  chrome="$(chromium_path)"
  [ -n "$chrome" ] && [ -x "$chrome" ]
}

if ! installed; then
  if [ ! -x "$GSTACK_DIR/setup" ]; then
    # Remove a partial clone left by an earlier failed run.
    rm -rf "$GSTACK_DIR"
    mkdir -p "$HOME/.claude/skills"
    git clone --quiet --single-branch --depth 1 https://github.com/garrytan/gstack.git "$GSTACK_DIR" >&2
  fi
  # Output goes to stderr so it doesn't reach Claude's context. A failed browser
  # download leaves the other skills working, so it doesn't stop the session.
  (cd "$GSTACK_DIR" && ./setup --quiet </dev/null) >&2 || echo "gstack setup reported a problem; see output above" >&2
fi

# Playwright's headless shell doesn't trust this environment's proxy certificate,
# but the full Chromium does, so point gstack's browser at it.
chrome="$(chromium_path)"
if [ -n "$chrome" ] && [ -x "$chrome" ] && [ -n "${CLAUDE_ENV_FILE:-}" ]; then
  echo "export GSTACK_CHROMIUM_PATH=\"$chrome\"" >> "$CLAUDE_ENV_FILE"
fi
