---
name: source-every-claim
description: Make sure every factual claim and number in prose (blog posts, reports, PR and issue text, commit messages, mailing-list posts) rests on evidence a reader could check, before it is shown or published. Builds a claim ledger, verifies cited artefacts exist, and hunts overclaims. Use on any draft that asserts facts, numbers, causes or comparisons.
---

The failure this prevents: a conclusion gets written down, the run that
produced it gets thrown away, and a week later nobody (including the
author) can tell whether the number was ever true.  In one re-check of
six figures from a published audit, five failed: a query had matched on
the wrong name, a "non-vacuity check" had no artefact at all, a headline
before-and-after table was not reproducible in any configuration, a
"zero reports" result had been measured on a tree that already had the
fixes applied, and a "all four are spurious" was two of four.  Three of
the five were in already-posted text and had to be corrected in public.
Every one had the same cause: the claim survived, the evidence did not.

## The rule

Every sentence that makes a checkable claim rests on one of:

- **measured**: output or file contents observed directly, with the
  artefact saved (raw output, the exact command, the commit or version it
  ran on, and the toolchain) somewhere durable;
- **derived**: reasoning from premises that are themselves sourced;
- **reported**: a named external source the reader can follow (a link,
  a commit, a paper, a quote with its origin).

Anything else is **assumed**, and assumed claims do not get published
as facts.  Rephrase them as an inference ("I think", "probably",
"this suggests") or as a question, or cut them.

## Procedure

1. **Build the ledger.**

       <this skill's directory>/claim-ledger DRAFT.md > DRAFT.claims.md

   It lists every sentence with a number, a universal, a causal or
   comparative word, or a verification word ("verified", "shows").  It
   is a starting list: add claims it missed, delete rows that are not
   claims.  Fill in `class` (measured / derived / reported / assumed /
   cut) and `source` (artefact path, URL, commit, `file.c:123`, or for
   derived claims the row numbers of their premises).

2. **Check it mechanically.**

       <this skill's directory>/claim-ledger --check DRAFT.claims.md

   It fails on an empty class or source, on any *assumed* row, and on a
   cited local artefact that does not exist.  It cannot tell whether the
   artefact says what the sentence claims.  That is step 3.

3. **Open every source and compare.**  Read the cited artefact, not your
   memory of it, and check that it says what the sentence says, under
   the conditions the sentence implies.  Re-derive numbers from the raw
   output rather than copying them from notes.

4. **Hunt overclaims** (below), then fix the prose: narrow the claim,
   or downgrade it to an inference, or cut it.

5. **Keep the ledger** next to the draft.  When someone asks "where does
   this number come from?", the answer is one lookup.

## Traps that produce unsourced claims

**Subagent and reviewer summaries are not artefacts.**  Treat a
subagent's report as a pointer, not a citation: it is reliable about
*where* something is and unreliable about the detail that matters (one
reported a type parameter as unbounded when the source had a bound,
which reversed the conclusion of a review).  The same goes for another
model's verdict and for your own earlier statements in a long session.
Open the source before quoting a signature, a threshold, a number or a
line.

**Check the artefact you are citing, not just the claim you are
making.**  A log offered as proof may have been produced on a different
tree, a different version, or with the fix already applied.

**Stale state.**  Line numbers, configs, checkouts and statuses move.
Read from the current version, and re-verify every status (merged?
fixed? still open?) on the day of publication.

**Universals and causals are where claims break.**  "Anyone who
configures X silently measures nothing" was true on the author's test
setup and false on ordinary hardware, which a maintainer pointed out
publicly.  For every sentence with "anyone", "never", "always", "all",
"dead code", "because", or "fixes", ask: *under which ordinary
conditions is this false?*  The refutation lives in the configurations
your setup did not exercise.

**Say when a result comes from a crafted input.**  A test you designed
shows a mechanism, not a frequency.  "Four of seven names were cut to
the same 85 characters" read as real-world data loss when the seven
names had been chosen to share a prefix.  Say "crafted", or cut it.

**Don't claim more provenance than you have.**  "Based on what A and B
said" when half of it is extrapolated.  Say which part is inferred.

**Read and measured are different evidence.**  A read establishes what
the code or document says, not what the running system does.  When a
claim can be both read and tested, do both, and label a read-only claim
as provisional.  If the two disagree, the disagreement is the finding.

**Absence of evidence needs a positive control.**  Before writing "no
errors", "zero reports" or "not affected", show that the instrument
flags a case it must flag, using the same mechanism as the real case.
A tool that has stopped working returns silence, and silence reads
exactly like "clean".

**"No difference detected" is not "no difference".**  Claiming
negligible cost needs a stated margin and a design able to rule out
effects outside it.  Report effect size and noise, not just the verdict.

**Selection across runs.**  Five analyses with only the successful one
shown is cherry-picking even if each was honest.  Say how many were run
and how the shown one was chosen.

**Circular sources.**  A forum comment, blog or review written by the
author (or by the same model) is not independent confirmation.

**Defect claims need a positive trigger.**  Before saying something is
broken, have runnable evidence that it actually misbehaves: a failure, a
sanitiser report at the claimed site, a wrong counter.  "Reading the code
says this can happen" and "the branch is reachable" do not count; a
reachable branch has been publicly shown not to matter before.  Without
a trigger, reframe as a hardening proposal or drop it.

## Numbers specifically

- Every number has a unit and, where it is a rate or a share, a
  denominator.
- Re-derive headline numbers from raw data on the day they are written,
  never copy them from an earlier summary.
- Keep only the precision the argument needs (see *conservation of
  detail* in the prose-style pack); exact figures that are not the point
  make readers wonder what they were meant to notice.

## Corrections

When an earlier published claim turns out wrong, say so once, plainly,
where the original readers will see it, and record the correction
rather than silently rewriting the text.
