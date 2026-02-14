#!/usr/bin/env bash
set -e

# Publish script for CV portfolio – run from CV directory or repo root.
# Stages: install → build → ensure .nojekyll → commit → push to gh-pages via subtree

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CV_DIR="$SCRIPT_DIR"

echo "==> Stage 1: Install dependencies (npm)"
cd "$CV_DIR"
npm ci 2>/dev/null || npm install

echo "==> Stage 2: Build static export (npm run build)"
npm run build

echo "==> Stage 3: Ensure .nojekyll for GitHub Pages"
mkdir -p out
touch out/.nojekyll

echo "==> Stage 4: Commit all changes"
cd "$REPO_ROOT"
git add -A
if git diff --staged --quiet; then
  echo "    No changes to commit."
else
  git commit -m "Build CV for gh-pages"
fi

echo "==> Stage 5: Push to gh-pages via subtree"
git subtree push --prefix CV/out origin gh-pages

echo "==> Done. CV is published to the gh-pages branch."
