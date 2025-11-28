#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)"
BRANCH="gh-pages"
PUBLIC_DIR="$ROOT_DIR/public"
WORKTREE_DIR=""

cleanup() {
  if [[ -n "${WORKTREE_DIR}" && -d "${WORKTREE_DIR}" ]]; then
    git -C "$ROOT_DIR" worktree remove --force "$WORKTREE_DIR" >/dev/null 2>&1 || true
    rm -rf "$WORKTREE_DIR"
  fi
}
trap cleanup EXIT

if ! git -C "$ROOT_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "⚠️  Not a git repository. Run this script from inside a cloned repo."
  exit 1
fi

CURRENT_BRANCH="$(git -C "$ROOT_DIR" rev-parse --abbrev-ref HEAD)"

if [[ -n "$(git -C "$ROOT_DIR" status --porcelain)" ]]; then
  echo "💾 Detected local changes on $CURRENT_BRANCH. Committing before deploy..."
  git -C "$ROOT_DIR" add -A
  if git -C "$ROOT_DIR" diff --cached --quiet; then
    echo "ℹ️ Nothing to commit after staging."
  else
    source_msg="chore: update site $(date '+%Y-%m-%d %H:%M:%S %Z')"
    git -C "$ROOT_DIR" commit -m "$source_msg"
  fi
  git -C "$ROOT_DIR" push origin "$CURRENT_BRANCH"
else
  echo "ℹ️ Working tree clean on $CURRENT_BRANCH."
fi

echo "🚀 Building site with Hugo..."
(cd "$ROOT_DIR" && hugo --minify)

# Make sure gh-pages exists locally
if git -C "$ROOT_DIR" show-ref --verify --quiet "refs/heads/$BRANCH"; then
  git -C "$ROOT_DIR" fetch origin "$BRANCH" >/dev/null 2>&1 || true
else
  git -C "$ROOT_DIR" branch "$BRANCH" || true
fi

WORKTREE_DIR="$(mktemp -d)"
echo "📦 Preparing worktree at $WORKTREE_DIR"
git -C "$ROOT_DIR" worktree add -f "$WORKTREE_DIR" "$BRANCH"

# Clean worktree contents except .git, then copy build artifact
find "$WORKTREE_DIR" -mindepth 1 -maxdepth 1 ! -name '.git' -exec rm -rf {} +
cp -a "$PUBLIC_DIR"/. "$WORKTREE_DIR"/

pushd "$WORKTREE_DIR" >/dev/null
git add -A
if git diff --cached --quiet; then
  echo "ℹ️  No changes to publish; gh-pages is up to date."
else
  msg="Deploy site $(date '+%Y-%m-%d %H:%M:%S %Z')"
  git commit -m "$msg"
  git push origin "$BRANCH"
  echo "✅ Published to https://avijit9.github.io/DriveXplain/"
fi
popd >/dev/null

echo "✨ Done."
