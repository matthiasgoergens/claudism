#!/bin/sh
# Positive and negative controls for the mechanical checkers.  A checker
# that has silently stopped seeing anything passes its negative controls
# too, so every checker needs a positive control that must fail.
set -u
here=$(cd "$(dirname "$0")" && pwd)
root=$(dirname "$here")
lint=$root/plugins/prose-style/skills/llm-isms/llm-isms
status=0

expect() {  # expect <exit code> <description> <command...>
    want=$1; what=$2; shift 2
    out=$("$@" 2>&1); got=$?
    if [ "$got" -eq "$want" ]; then
        echo "ok   $what"
    else
        echo "FAIL $what (exit $got, wanted $want)"; echo "$out" | sed 's/^/     /'
        status=1
    fi
}

expect 1 "llm-isms flags the planted tics"        "$lint" "$here/llm-isms/positive.md"
expect 0 "llm-isms ignores code and exempt regions" "$lint" "$here/llm-isms/negative.md"
expect 0 "llm-isms: marker mentioned in prose does not end a region" "$lint" "$here/llm-isms/marker-in-prose.md"
expect 0 "llm-isms: its own SKILL.md is exempt"   "$lint" "$root/plugins/prose-style/skills/llm-isms/SKILL.md"
n=$("$lint" "$here/llm-isms/positive.md" | grep --count '^    ->')
expect 0 "llm-isms flags all 16 planted tics (got $n)" test "$n" -eq 16

n=$("$lint" --strict "$here/llm-isms/strict.md" | grep --count 'consider:')
expect 0 "llm-isms --strict suggests the antithesis and the fragment (got $n)" test "$n" -eq 2
expect 1 "llm-isms flags 'The detail that matters'" "$lint" "$here/llm-isms/strict.md"

tsv=$(mktemp); printf 'frobnicat\\w*\tpersonal test pattern\tsay what it does\n' > "$tsv"
echo "We frobnicate the cache." > "$tsv.md"
expect 1 "llm-isms loads personal patterns" env LLM_ISMS_PATTERNS="$tsv" "$lint" "$tsv.md"
printf 'disable\tem-dash\n' > "$tsv"; printf 'A dash \342\200\224 here.\n' > "$tsv.md"
expect 0 "llm-isms honours disable lines" env LLM_ISMS_PATTERNS="$tsv" "$lint" "$tsv.md"
expect 1 "llm-isms flags em-dash when not disabled" env LLM_ISMS_PATTERNS=/nonexistent "$lint" "$tsv.md"
rm -f "$tsv" "$tsv.md"  # BSD rm has no long options

ledger=$root/plugins/claim-sourcing/skills/source-every-claim/claim-ledger
n=$("$ledger" "$here/claim-ledger/draft.md" 2>/dev/null | grep --count '^| [0-9]')
expect 0 "claim-ledger extracts 3 claims and skips code (got $n)" test "$n" -eq 3
expect 0 "claim-ledger --check passes a sourced ledger" "$ledger" --check "$here/claim-ledger/good.claims.md"
expect 1 "claim-ledger --check fails an unsourced ledger" "$ledger" --check "$here/claim-ledger/bad.claims.md"
n=$("$ledger" --check "$here/claim-ledger/bad.claims.md" | grep --count 'claim [0-9]')
expect 0 "claim-ledger reports missing artefact, assumed, no class, no source (got $n)" test "$n" -eq 4

leak=$root/plugins/publish-gate/skills/before-publishing/leak-check
expect 1 "leak-check flags local paths and internal words" env PUBLISH_GATE_WORDS="$here/leak-check/words.txt" "$leak" "$here/leak-check/leaky.md"
n=$(env PUBLISH_GATE_WORDS="$here/leak-check/words.txt" "$leak" "$here/leak-check/leaky.md" | grep --count '^FAIL')
expect 0 "leak-check FAILs the absolute path and the word (got $n)" test "$n" -eq 2
expect 0 "leak-check passes clean prose" env PUBLISH_GATE_WORDS="$here/leak-check/words.txt" "$leak" --medium mail "$here/leak-check/clean.md"

exit $status
