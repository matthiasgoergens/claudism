---
name: second-opinion
description: Get an independent adversarial check of a claim or a draft from a different model family (codex, DeepSeek, Kimi, Gemini, a fresh subagent), and treat the answer correctly. Use when a conclusion is about to be acted on or published and the only evidence is the session's own reasoning.
---

Two model families that fail differently are worth much more than one
family asked twice.  Agreement across families is the strongest cheap
evidence available.  Disagreement is a finding, to be settled by
measurement, never by averaging or by picking the more confident answer.

## Before sending anything

Sending a draft or code to another vendor's API publishes it to that
vendor.  Check what the user has approved: open-source material is
usually fine, proprietary code and private correspondence need explicit
permission, and credentials never go.

## Ask it to refute, not to review

A reviewer agrees; a refuter has to find something.  Spell out the
mechanism, not just the conclusion.  "Does this have a bug?" gets a
survey; "here is the exact call chain I claim, refute it" gets a check,
and lets it tell you the path itself is wrong, which is the most useful
answer it can give.

    Adversarially review this claim and try to REFUTE it.
    CLAIM: <one precise claim, mechanism spelled out>.
    EVIDENCE OFFERED: <the measurement or source lines it rests on>.
    Read the real sources.  Look for anything that makes it false,
    unreachable, or true only under conditions the evidence did not cover.
    Propose the cheapest measurement that would settle it, with its
    expected output under each verdict.
    End with: VERDICT: REFUTED | CONFIRMED | UNVERIFIABLE, and why.

For prose, hand it the draft and ask, for every universal or causal
sentence, "under which ordinary conditions is this false?"

Examples of a headless call (any equivalent works):

    codex exec --ephemeral -m <cheap model> --output-last-message verdict.txt '<prompt>' < /dev/null
    kimi -p '<self-contained prompt>'

Give it a generous token and time budget: starved runs come back empty
and get re-run anyway.  Run in the background and keep working.  Save
the verdict to a durable file.

## Vary the lens, not just the effort

Running the same review harder finds the same class of thing.  Cheap
lenses that find different things, and can run in parallel:

- *break it*: attack the claim or design, prefer measuring to reading,
  and treat "looks fine" as a failed review;
- *alternatives*: what was not considered;
- *prior art*: how has the field already solved this?  The answer is
  often a named mechanism with twenty years of scars;
- *the reader's lens*: what would the person who has to accept this
  actually say?  Their past reviews, and above all what they rejected,
  are the evidence;
- *question the premise*: is this the right thing to be claiming or
  fixing at all?

The lenses about other people's knowledge and about the question itself
are the ones most easily forgotten.

## Re-running a reviewer

Tell it what you concluded about its last round, finding by finding,
with the source argument for each refutation, where it was right, what
is stale, and which questions you cannot answer yourself.  Uninformed,
a second round mostly repeats the first; informed, it spends its budget
on paths nothing has reached yet.

## How to treat the answer

- **It is reported evidence, not measured.**  Verify any specific fact
  against the source before relaying or acting on it.  That applies to
  REFUTED as much as to CONFIRMED: a model can produce a concrete,
  plausible counter-example that rests on misreading a data structure,
  and one command settles it.
- **Run the measurements it proposes** (read them first; never run
  anything destructive), feed back the raw output, and give it a second
  round before scoring the verdict.  A verdict whose proposed
  measurements were never run is opinion, in either direction.
- **Good confirmer, poor discoverer.**  It checks the claim you hand it.
  It will not catch a claim you got wrong in a way you did not think to
  ask about.  Use it to harden a conclusion, not instead of tracing the
  evidence yourself, and do not read CONFIRMED as independent discovery.
- **A tell that it did real work**: it names files, lines or sources you
  did not give it, and engages with counter-arguments rather than
  restating your claim.
- **Prove the reviewer sees positives.**  Before trusting its silence,
  hand it a known defect once and check that it finds it.  Silence from
  a broken tool reads exactly like silence from correct work.
