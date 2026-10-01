---
name: prose-feedback
description: Give an author feedback on their draft (blog post, newsletter, essay, PR description, email) without rewriting it. Notes quote the text, say what the problem is and why, and are ranked by how much fixing them helps. Use when someone asks for feedback, a critique, a review or "what do you think" about their writing, rather than for an edit.
---

<!-- llm-isms: off -->

The author keeps the pen.  Your job is to show them what a reader will
trip over, clearly enough that they can fix it in their own voice.  A
rewrite teaches nothing, replaces their voice with yours, and smuggles
in your tics.

## Rules

- **Do not rewrite the piece**, or any paragraph of it, unless the
  author asks.  A suggested replacement is allowed for a phrase or a
  short sentence, when the fix is easier to show than to describe.
  Mark it as one option among several.
- **Quote exactly.**  Every note starts with the words it is about, so
  the author can find them.  No note is about "the tone in general"
  without at least two quotes showing it.
- **Say why, in terms of the reader.**  "A reader stops here because
  ..." beats "this is weak".  Name the pattern when there is one ("X,
  not Y" antithesis, announced significance, unsourced number), so the
  author can find the other instances themselves.
- **Rank by impact.**  Put first what most changes how the piece lands:
  a wrong fact, an unsupported central claim, a confusing structure.
  Phrase-level tics come after.  Mark each note **must**, **should** or
  **could**.
- **Do not pile on.**  When a pattern recurs, give it one note with two
  or three quotes and "and N more like it", not N notes.
- **Say what works**, briefly and specifically, so the author knows
  what to keep: "the Jump paragraph is concrete and dated" helps;
  "great piece!" does not.
- **Respect the author's choices.**  Their metaphors, register and
  opinions are theirs.  Flag them only when a reader would misread
  them, and say so as a question, not a correction.
- **Separate fact from style.**  If a claim looks wrong or unsourced,
  say what you checked and what you found, with the source, and mark
  whether you verified it or only suspect it.

## Procedure

1. Read the whole piece once as its intended reader before noting
   anything.  Write down, in one sentence, what you think it is trying
   to say.  If you cannot, that is the first note.
2. Run the mechanical checker for the pattern-level notes:

       <the llm-isms skill's directory>/llm-isms --strict DRAFT

   Use its hits as candidates, not as notes: read each in context and
   keep the ones a reader would actually notice.  (Run on the feedback
   itself, the checker will flag the tics you quote; that is expected.)
3. If the `source-every-claim` skill is installed and the piece makes
   factual claims, build the claim ledger and check the claims the
   piece relies on.  Report what you found; do not rewrite the
   sentences.
4. Write the feedback in the format below.

## Format

```
**In one sentence:** <what the piece says, as you read it>

**What works:** <two or three specific things>

**Notes**

1. [must] "<exact quote>"
   <what a reader will do here and why>.  <Optional: one possible
   rewording of this phrase.>

2. [should] "<quote>", "<quote>", and 4 more like them
   <the pattern, why it costs the reader, how to spot the rest>.

...

**If you only fix three things:** <numbers of the three notes>
```

**Length follows content, not a ratio.**  A short piece with five
factual errors can need more feedback than its own length; a long piece
with one problem needs three lines.  What matters is that the author can
stop reading at any point and have the most useful notes:

- most important first, and "If you only fix three things" at the end;
- each note short (a few sentences): the problem and why, not the full
  evidence;
- evidence in a separate file (a fact-check, a claim ledger) that the
  note points to, so the notes stay scannable;
- one note per pattern, not one per instance;
- nothing said twice.

Before handing it over, check that every quote that opens a note
appears verbatim in the draft (search for it), and cut any note that
repeats another.

## When the author then asks for an edit

Switch to editing only for what they asked about, and show the changes
as a list of before/after pairs, so they can accept or reject each one.

<!-- llm-isms: on -->
