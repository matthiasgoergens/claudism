# claudism

Skills for coding agents that make the prose they write less annoying to
read and better supported by evidence.  They work in Claude Code, Codex,
Kimi Code and any other agent that reads `SKILL.md` folders.

<!-- llm-isms: off -->
A typical edit they produce:

> **Before:** The fix was small.  The impact was not.  Here's the
> thing: the cache was never the bottleneck — the lock was.
>
> **After:** The fix holds the lock for less time.  The profile shows
> that most of the time went there (`profile.txt`).
<!-- llm-isms: on -->

The rules come from correcting model-written blog posts, GitHub issues
and pull requests, and Linux kernel patches.  Most of the judgement
rules in the skills keep a one-line note of the case that prompted them.

There are three packs.  Install whichever you want; none needs another.

| Pack | What it does | Skills | Script |
|------|--------------|--------|--------|
| `prose-style` | Removes LLM writing tics; keeps your corrections as a growing house style | `llm-isms`, `house-style` | `llm-isms` |
| `claim-sourcing` | Makes every claim rest on evidence a reader could check | `source-every-claim`, `skeptic`, `second-opinion` | `claim-ledger` |
| `publish-gate` | Order of checks before anything is posted; a new agent reads the draft as its audience would; leak check | `before-publishing`, `fresh-reader` | `leak-check` |

## prose-style

<!-- llm-isms: off -->
`llm-isms` is a regex checker for tics that a human reader recognises at
once: em-dashes and their ` -- ` stand-ins, announced significance
("That's the tell."), colon reveals ("The detail that matters:"),
teasers, slogans, moral closers, self-certified honesty ("one honest
caveat"), stock section headings ("What this is not").  The default
patterns are narrow, so that a hit is usually worth fixing.
`--strict` adds rhetorical shapes that are fine once but a tic in bulk
("X, not Y." antitheses, one-line punch paragraphs) as suggestions, and
prints their rate per 1000 words.  For scale: one author's 42,000 words
of edited blog prose came to 0.7 per 1000, and a 750-word LinkedIn
newsletter to 10.6 (`docs/measurements.md` has the commands).  It also
counts sentences with stacked clauses, separately.
<!-- llm-isms: on -->

```
$ llm-isms draft.md
draft.md:12: colon-reveal setup
    The detail that matters: that team ran roughly $1bn ...
    -> state the detail; if it matters, the reader will see it
```

The skill then has the agent do the checks a regex cannot: whether a
neat sentence is still true when restated flatly, whether precision
informs or decorates, whether a sentence reports a result or narrates
the work.

Add your own patterns, or switch built-in ones off (if you like
em-dashes, say), in `~/.config/llm-isms/patterns.tsv`; `llm-isms --help`
gives the format.

`house-style` keeps your recurring edits in `~/.config/house-style.md`
and adds to it each time you correct a draft, so each correction is made
once.  A starter file is included; edit it freely.

## claim-sourcing

`source-every-claim` has the agent list every checkable sentence in a
draft (numbers, universals such as "never" or "anyone", causal and
comparative claims, "verified") in a table called a claim ledger, and
mark each one with its evidence:

- *measured*: observed directly, with the raw output saved;
- *derived*: reasoned from other sourced claims;
- *reported*: from a source the reader can follow, such as a link;
- *assumed*: none of these, so it must be reworded as an inference or
  question, or cut.

`claim-ledger DRAFT.md` builds the table; `claim-ledger --check` fails
on unsourced or assumed rows and on cited files that do not exist.  The
skill also lists the usual ways unsourced claims get in: a subagent's
summary quoted as fact, stale state, a crafted test reported as a
frequency, "no errors" from a tool never shown to detect one.

`skeptic` audits the claims a working session has come to rely on,
before they are acted on or published.  `second-opinion` covers asking a
different model to refute a claim, and how to weigh its answer.

## publish-gate

`before-publishing` sets the order of the checks above and the
hand-over rules: the user sees the full text before anything is posted,
and new findings are batched into one post rather than a stream of
corrections.  `fresh-reader` has an independent agent read the draft
with only what its audience will have and flag everything they could not
follow.  `leak-check` flags local paths, commit hashes that exist only
on your machine, words from your own list of internal names
(`~/.config/publish-gate/internal-words.txt`), and wrapping that is
wrong for mail or for GitHub.

## Installing

Claude Code, as plugins:

```
/plugin marketplace add matthiasgoergens/claudism
/plugin install prose-style@claudism
/plugin install claim-sourcing@claudism
/plugin install publish-gate@claudism
```

Any agent that reads skill folders: `install.sh` symlinks the skills
into `~/.claude/skills` and `~/.agents/skills` (read by Codex and Kimi
Code), whichever exist, or into each `--target DIR` you give.  `--copy`
copies instead of linking.

```
git clone https://github.com/matthiasgoergens/claudism
cd claudism
./install.sh prose-style claim-sourcing       # or: ./install.sh all
./install.sh --bin ~/.local/bin all           # also put the scripts on PATH
```

Each script sits in its skill's folder, and the skills tell the agent to
run it from there, so agents need nothing on PATH.  To run the scripts
yourself, use `--bin`, or call them from the clone, e.g.
`plugins/prose-style/skills/llm-isms/llm-isms draft.md`.

Skills load when the agent decides they apply.  For rules that should
hold all the time, paste the matching file from `snippets/` into your
`CLAUDE.md` or `AGENTS.md`.

The scripts need only Python 3.  `tests/run.sh` checks that each one
catches planted problems and passes clean text.

## Contributing a tic

If your agent keeps doing something these packs miss, open an issue or
a pull request with the sentence it wrote and what you changed it to.
A pattern belongs in the default set only if it almost never fires on
good prose; otherwise it goes in `--strict`.

## Licence

MIT, see `LICENSE`.
