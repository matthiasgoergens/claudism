# Prompt: a second model reads for tics

<!-- llm-isms: off -->

Hand this to a different model (or a fresh subagent) when a piece
matters.  It finds tics the regexes cannot, and it is cheap.  Fill in
the angle-bracketed parts.

```
Review <draft path> for PROSE, not facts.  The author's voice is in
<two or three earlier pieces by the same author>; read them first.
<Optional: here is a list of tells the author already removed, e.g. a
commit or diff: ...>

1. Find every remaining stock LLM rhetorical move: announced
   significance, "not X but Y" flourishes, aphorism clinchers, triplets,
   rhetorical questions, teasers, colon reveals, moral closers,
   self-certified honesty, process narration, inspirational sign-offs.
   Quote each one exactly.
2. For each, give a concrete replacement in the author's voice, or say
   "delete".  Keep facts and numbers exactly as they are; add no claims.
3. Flag sentences that are padded, repeat an earlier point, or explain
   the significance of what they just said instead of saying it.
4. Flag anything that does not sound like the author compared with the
   earlier pieces (register, sentence length, hedging).
5. Check spelling against <variety, e.g. British English>.

Do not edit any file.  Output a numbered list of (quote, problem,
replacement), then one paragraph on whether the piece reads as written
by the author.
```

Treat the answer as suggestions: apply what holds up, and never let it
rewrite the author's own phrasing silently.
