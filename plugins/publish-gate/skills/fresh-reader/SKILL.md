---
name: fresh-reader
description: Have an independent agent read a draft with only what its real audience will have (the public thread, the venue, the project's public pages) and flag every reference, number, term or claim such a reader could not understand or check. Use before publishing any prose written inside a long working session.
---

A draft written at the end of a long session is full of context the
reader does not have: run names, harness vocabulary, local hashes, "the
earlier approach", numbers whose setup lives only in the session.  The
author cannot see these, because the author has the context.  A reader
who starts from zero can.

## How to run it

1. **Use a genuinely fresh agent**: a new subagent or another tool's
   headless mode, *not* a fork of this session.  A fork inherits the
   context that makes the leaks invisible.
2. **Give it only what the reader has**: the draft, the public thread or
   page it will appear in, and the project's public presence (repository,
   docs, earlier posts).  Not your notes, not the session, not the local
   checkout unless the reader will have it.
3. **Use the prompt below**, filled in.
4. **Fix what it finds**, then run it again on the edited draft if the
   edits were substantial.  A fresh reader is only fresh once per draft
   version; for the second pass use another new agent.

## Prompt

```
You are a first-time reader of the text below.  It will be published at
<venue: e.g. a reply in <public thread URL>, a blog post on <site>, a PR
to <repo>>.  You know only what such a reader knows: the text, <the
thread / the repo's public pages / the author's earlier posts>, and
general knowledge of the field.  Do not assume anything else.

Flag, quoting the exact words:
1. every reference you cannot resolve: names of runs, tools, machines,
   people, earlier messages, "the previous approach", commit hashes,
   paths, numbered findings;
2. every number whose setup you cannot reconstruct (what was measured,
   on what, compared with what);
3. every term used as if already defined;
4. overclaims: universal or causal sentences ("anyone", "never",
   "always", "because", "fixes") that might be false under ordinary
   conditions the text does not rule out;
5. judging words that grade instead of specify ("truthful", "clean",
   "proper", "remarkable");
6. process narration: sentences about how thoroughly the work was done
   rather than what was found;
7. the first point where you would stop reading, and why.

For each, say what a reader would need to make sense of it.  Do not
rewrite the text.  End with the one change that would help this reader
most.
```

## Treating the result

Its findings are about comprehension, so most are cheap to act on:
define, link, or cut.  Cutting is often right; sentences that need
internal context are usually about process, not results.  Where it flags
an overclaim, hand the sentence to `source-every-claim` (if installed)
rather than just rewording it.
