#!/bin/sh
# Install one or more packs as plain skill directories, for agents that
# read SKILL.md folders (Claude Code, Codex, Kimi Code, Cursor, ...).
# Claude Code users can use the plugin marketplace instead; see README.
#
#   ./install.sh [--copy] [--target DIR]... [--bin DIR] PACK...
#
# PACK is prose-style, claim-sourcing, publish-gate, or all.
# --target  skills directory to install into (repeatable).  Default: each
#           of ~/.claude/skills and ~/.agents/skills that exists.
# --copy    copy instead of symlinking (symlinks follow `git pull`).
# --bin     also link the checker scripts into DIR (e.g. ~/.local/bin).
set -eu

here=$(cd "$(dirname "$0")" && pwd)
copy=no
nl='
'
targets=   # newline-separated, so that paths may contain spaces
bindir=
packs=

while [ $# -gt 0 ]; do
    case $1 in
        --copy) copy=yes ;;
        --target) shift; targets="$targets$1$nl" ;;
        --bin) shift; bindir=$1 ;;
        -h|--help) sed -n '2,13p' "$0"; exit 0 ;;
        all) packs="prose-style claim-sourcing publish-gate" ;;
        *) [ -d "$here/plugins/$1/skills" ] || { echo "unknown pack: $1" >&2; exit 2; }
           packs="$packs $1" ;;
    esac
    shift
done
[ -n "$packs" ] || { sed -n '2,13p' "$0"; exit 2; }

if [ -z "$targets" ]; then
    for d in "$HOME/.claude/skills" "$HOME/.agents/skills"; do
        [ -d "$d" ] && targets="$targets$d$nl"
    done
fi
[ -n "$targets" ] || { echo "no skills directory found; pass --target DIR" >&2; exit 2; }

for pack in $packs; do
    for skill in "$here/plugins/$pack/skills"/*/; do
        skill=${skill%/}
        name=$(basename "$skill")
        printf '%s' "$targets" | while IFS= read -r t; do
            mkdir -p "$t"
            dest=$t/$name
            if [ -e "$dest" ] && [ ! -L "$dest" ]; then
                echo "skip $dest: exists and is not our symlink" >&2
                continue
            fi
            rm -f "$dest"
            if [ $copy = yes ]; then cp -R "$skill" "$dest"; else ln -s "$skill" "$dest"; fi
            echo "installed $pack/$name -> $dest"
        done
        if [ -n "$bindir" ]; then
            mkdir -p "$bindir"
            for f in "$skill"/*; do
                if [ -f "$f" ] && [ -x "$f" ]; then
                    ln -sf "$f" "$bindir/$(basename "$f")"
                    echo "linked $(basename "$f") -> $bindir"
                fi
            done
        fi
    done
done
