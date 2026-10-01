---
name: llm-isms
description: Check prose meant for a human reader (blog posts, docs, commit messages, PR and issue text, mailing-list posts, emails) for LLM writing tics before showing it to the user or publishing it. Runs a mechanical checker, then the judgement checks no regex can do. Use after drafting any prose that will leave the session.
---

<!-- llm-isms: off -->

Model-written prose drifts toward a register that sounds considered and
says less.  Correcting one instance does not stop the next: tics that
were corrected recur within hours.  So this is a check that runs, not
an intention to be careful.

## 1. Run the mechanical checker

    <this skill's directory>/llm-isms FILE...
    git diff | <this skill's directory>/llm-isms -

It flags narrow patterns only, so a hit is usually worth fixing; the
fix line says when it is not.
Fenced code, inline code spans, and regions between `llm-isms: off` and
`llm-isms: on` markers are skipped.  `--list` prints the patterns.

`--strict` also suggests rhetorical shapes that are fine once and a tic
in bulk ("X, not Y." antitheses, one-line punch paragraphs, "no longer
a ...") and prints their rate per 1000 words.  Use the rate, not the
individual hits: one author's edited blog prose ran at about 0.7 per
1000 words, a LinkedIn newsletter at 10.6.  As a guess, not a measured
threshold: above 2 or 3, rewrite the worst ones.

Run it on anything a human will read: blog posts, cover letters, issue
and PR bodies, commit messages, docs.  Not on code, not on private notes,
and not on text whose reader is an agent (skills, AGENTS.md, CLAUDE.md).
There, meet the agent where it is: words like "load-bearing" are how it
already thinks, and an instruction phrased in its own vocabulary is
more likely to be followed.

**When the user catches a tic the checker missed, add a pattern.**  That
is the point of the tool, and it is cheap.  Personal patterns go in
`~/.config/llm-isms/patterns.tsv` (`regex<TAB>problem<TAB>fix`), so they
survive updates of this skill.  Keep them narrow: a pattern that fires
on good prose teaches everyone to ignore the checker.

## 2. Then the judgement checks

**Is the sentence shaped like insight?**  Balanced clauses and abstract
nouns ("structurally absent rather than merely busy", "hard to see from
inside") read as though a point has been made.  Ask what a reader could
check.  If nothing, cut.

**Be suspicious of verbal flourish.**  Drama adverbs ("quietly costs"),
teasers ("then the story got more interesting"), colon reveals ("The
most interesting find:"), slogans ("you do not remove the lottery, you
average over it"), moral closers ("That is the usual fate of small
ideas"), punchlines about what everyone thought ("the regression
everyone had filed away as fixed"), and verdicts that judge instead of
report ("its own ideas fared worse", when trying many things that fail
is normal work).  Each one reads as a point being made.  Write the thing
the reader could check instead.  One blog post needed some twenty such
cuts.

**Rhetorical neatness is a tripwire, not a virtue.**  Symmetry,
parallels, "not X but Y" reversals, triplets, rhetorical questions and
punchy closing lines get *extra* scrutiny, not less.  The test, sentence
by sentence: restate the pretty sentence in flat prose and check whether
the flat version is true and supported.  If it is not, do not publish
the pretty one.  Fluency is zero evidence.  The riskiest spots are
closing sentences and parallels whose two halves have unequal support,
so apply it hardest to the last paragraph, where the temptation to land
a resonant closer is strongest and the evidence usually thinnest.

**Is it process narration?**  "After an independent adversarial review
by two model families ...", "worth surfacing rather than hiding",
"including the wrong parts, because that is where the method earned its
keep".  How thoroughly the author worked is not the reader's business
unless they ask; state the findings.  This is among the strongest
machine-generated tells.  Code comments get the same rule: no history,
no "the fix", no dates, no review rounds; a comment must read correctly
years after merge.

**Is there an unmarked baseline?**  Do not present one country's
perspective as the neutral default ("domestic box office" meaning
US/Canada), and do not use seasons ("this summer") for readers who may
live where there are none.  Label the data; use calendar time.

**No inflated combat metaphors.**  "Weaponise", "assault on", "battle
lines" for things where nothing violent happens.

**Is the grammar as simple as the idea allows?**  Prefer subject, verb,
object.  Long sentences are fine; nested ones are the problem.  Split a
sentence that stacks relative clauses ("the time the lock is held,
which the profile showed was where the time went"), and put the actor
first ("the fix holds the lock for less time").  `--strict` counts
sentences with two or more relative clauses, and any over 50 words, as
a separate rate.  Keep a complex sentence when its structure carries
the meaning (a condition and its exception, a cause and its
consequence).

**Is precision doing work, or decorating?**  "byte-identical" where
"unchanged" is meant.  "every image I have" where the claim is about the
ones that were run.  Claim exactly what was done.  The converse also
holds: *conservation of detail*.  Every specific detail tells the reader
it matters, so "3,338 images" or "107 of 7,595" where "a few thousand"
or "about 1%" is all the sentence needs makes the reader wonder what
they were meant to notice.  Keep exact numbers where they carry the
argument or the reader can act on them.

**Am I defending a claim instead of narrowing it?**  Three sentences
guarding against a misreading mean the claim is too broad.  "fs/ntfs3
rejects both while loading $Volume, so it is not affected by these
images, but I did not try fuzzing its parser" replaced a paragraph that
explained at length what the result did not show.

**Am I explaining something to its author?**  Telling a maintainer how
their own fix works, with my failed attempt as the illustration, is
about my process, not their work.  Cut it.  A genuinely new fact is
usually one clause.

**Am I mirroring?**  Echoing the reader's point back ("You're right that
I haven't ...") or describing plans at length.  Thank briefly, state the
next action, ask any genuinely open question, stop.

**Am I stating a default?**  Say what is unusual, not what the reader
already assumes.  On a mailing list a patch series is assumed
independent unless it says otherwise, so "these are independent" is like
writing "this patch is not a revert".

**Would this word mean anything to someone who has never seen my
tooling?**  Internal vocabulary (run names, harness terms, agent names,
local paths) leaks most easily into sentences describing how thoroughly
something was checked, and those sentences are usually the cuttable ones
anyway.

**Would a person say this out loud?**  A human rewrite ("X ain't
perfect, but I find its signal-to-noise ratio good enough to be a net
positive, despite the high token costs") beat the model's version
because it made three checkable claims and one of them made the
author's position sound expensive.  Nobody invents a detail that costs
them something.

**Is there a "found by" flex?**  Say how something was found only when
the reader gains from it: credit, a reproducer they can use, or that it
hit a real user.  "Found by reading the code" tells them nothing.

**Is the length earned?**  Say each thing once.  Answer first, reason
second.  A cover letter's opening and its changelog should not repeat
each other.  Typical result of a tightening pass: a third shorter with
nothing lost.

For anything that matters (a blog post, a first message to a
maintainer), also have a *different* model read it for tics with the
prompt in `review-prompt.md` in this skill's directory.  It catches what
regexes cannot, and it is cheap.

## 3. Form for the medium

Plain-text mail (kernel and other mailing lists) wants hard wrapping at
about 72 columns.  GitHub issues, PRs and comments are the opposite:
GFM turns a single newline into a line break, so hard-wrapped text
renders as ragged short lines.  Keep tables and commands in fenced
blocks either way.  The two mistakes are not equally bad: GitHub text
can be edited, a sent mail cannot, so when the target is unclear, wrap.

A command block whose reader is meant to *run* it should be a plain
script they can copy whole.  One that *demonstrates* a result should be
a terminal session: `$ ` before each command, its output directly
underneath.

## 4. The author's own words

When editing someone else's draft, their words and metaphors are theirs.
Never override them silently; suggest improvements openly.  Cut only the
flourishes you added.

<!-- llm-isms: on -->
