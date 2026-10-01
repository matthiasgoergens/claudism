# claudism

Skills for coding agents (Claude Code, Codex, Kimi Code and anything
else that reads `SKILL.md` folders) that make the prose they write less
annoying to read and better supported by evidence.

They grew out of a few months of correcting model-written drafts: blog
posts, GitHub issues and pull requests, and patches for the Linux kernel
mailing lists.  Each rule is there because a draft broke it and a human
had to fix it, and most rules keep a short note of the case that
prompted them.

There are three packs.  Install whichever you want; none depends on
another, though they mention each other where they overlap.

| Pack | What it does | Skills | Script |
|------|--------------|--------|--------|
| `prose-style` | Removes LLM writing tics; keeps your corrections as a growing house style | `llm-isms`, `house-style` | `llm-isms` |
| `claim-sourcing` | Makes every claim rest on evidence a reader could check | `source-every-claim`, `skeptic`, `second-opinion` | `claim-ledger` |
| `publish-gate` | Order of checks before anything is posted; fresh-reader pass; leak check | `before-publishing`, `fresh-reader` | `leak-check` |

## prose-style

<!-- llm-isms: off -->
`llm-isms` is a regex checker for tics that a human reader recognises at
once: em-dashes and their ` -- ` stand-ins, announced significance
("That's the point."), teasers, colon reveals, slogans, moral closers,
self-certified honesty ("one honest caveat"), stock section headings
("What this is not"), and similar.  The patterns are narrow on purpose,
so that a hit is almost always worth fixing.
<!-- llm-isms: on -->
The skill then walks the
agent through the checks a regex cannot do: whether a neat sentence is
still true when restated flatly, whether precision informs or decorates,
whether a sentence narrates process instead of reporting a result.

```
$ llm-isms draft.md
draft.md:12: announced significance
    That's the point.
    -> if it matters, the reader will see it; cut the announcement
```

Add your own patterns, or switch built-in ones off (if you like
em-dashes, for example), in `~/.config/llm-isms/patterns.tsv`; the file
format is described in `llm-isms --help`.

`house-style` keeps your recurring edits in `~/.config/house-style.md`
and adds to it every time you correct a draft, so you make each
correction once.  A starter file with rules from the original author is
included; edit it freely.

## claim-sourcing

`source-every-claim` makes the agent build a claim ledger for a draft:
every sentence with a number, a universal ("never", "anyone"), a causal
or comparative word, or a verification word is listed, and each must be
marked measured, derived or reported, with a source.  `claim-ledger
--check` fails on unsourced or assumed rows and on cited files that do
not exist, which enforces "save the run before you publish the number".
The skill also lists the traps that produce unsourced claims: summaries
treated as citations, stale state, crafted inputs reported as
frequencies, negatives without a positive control.

`skeptic` audits a session's load-bearing claims by evidence class.
`second-opinion` covers asking a different model family to refute a
claim, and how to treat what it says.

## publish-gate

`before-publishing` sets the order of the checks and the hand-over
rules: the user sees the full text before it is posted, and findings
are batched into one post instead of a stream of corrections.
`fresh-reader` has an independent agent read the draft with only what
its audience will have.  `leak-check` flags local paths, commit hashes
that exist only on your machine, words from your own list of internal
names, and wrapping that is wrong for mail or for GitHub.

## Installing

Claude Code, as plugins:

```
/plugin marketplace add matthiasgoergens/claudism
/plugin install prose-style@claudism
/plugin install claim-sourcing@claudism
/plugin install publish-gate@claudism
```

Any agent that reads skill folders (this links into whichever of
`~/.claude/skills` and `~/.agents/skills` exist, or into `--target DIR`):

```
git clone https://github.com/matthiasgoergens/claudism
cd claudism
./install.sh prose-style claim-sourcing       # or: ./install.sh all
./install.sh --bin ~/.local/bin all            # also put the scripts on PATH
```

Skills load on demand.  For rules that should apply all the time, paste
the matching file from `snippets/` into your `CLAUDE.md` or `AGENTS.md`.

The scripts need only Python 3.  `tests/run.sh` runs positive and
negative controls for all three.

## Contributing a tic

If your agent keeps doing something these packs miss, open an issue or
a pull request with the sentence it wrote and what you changed it to.
A pattern belongs in the checker only if it almost never fires on good
prose.

## Licence

MIT, see `LICENSE`.
