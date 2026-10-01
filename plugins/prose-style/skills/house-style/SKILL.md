---
name: house-style
description: Apply the user's personal house style to prose written in their voice (emails, mailing-list replies, cover letters, blog posts, PR and issue text) before they see it, and grow that style file every time they correct a draft. Use after drafting and before llm-isms and any review pass.
---

The user is the bottleneck on anything published in their name, and
most of their edits to drafts are mechanical and recur.  This skill
applies those edits before they read anything, and records each new
one so they never have to make it twice.

## Where the style lives

Read, in this order, whichever exist:

1. `HOUSE-STYLE.md` at the root of the current project (project rules
   win on conflict: a project's own conventions for strings, docs and
   comments inside code beat personal habits).
2. `~/.config/house-style.md` (personal rules).

If neither exists, say so once, offer to create
`~/.config/house-style.md` from `house-style.example.md` in this skill's
directory, and fall back to that example's rules for this draft.

Keep the rules outside this skill's directory so that updating the
skill never overwrites them.

## When writing for someone else's project

A project has its own house style, and prose that does not match it is
the most visible machine-generated tell.  Measure it rather than assume
it: read the last twenty or thirty *accepted* PR descriptions or commit
messages (title length, body length, prose or bullets, what they never
mention), write the observations into `HOUSE-STYLE.md` in your notes,
and match them.  Two projects in the same language can differ a lot.

When writing in an author's voice (a blog, a newsletter), read two or
three of their existing pieces first and compare register, sentence
length and hedging against them.

## Applying it

Apply every rule to the draft, then run `llm-isms`.  The order that
wastes least of the user's time is: draft, this skill, `llm-isms`, any
mechanical preflight, review passes, and only then the user.  The user
should only ever read text that has passed all of these; showing them a
draft and fixing it afterwards doubles their reading.

## Growing it

Every time the user edits a draft or says "don't do X", ask whether the
edit generalises.  If it does:

- add it to the style file as one rule, in their words where possible,
  with the date and a one-line example of what it replaced;
- apply it at once to every other pending draft, not only the one they
  corrected;
- if it is a pure pattern (a phrase, a punctuation habit), also add it
  to the `llm-isms` personal patterns so it is caught mechanically.

A rule without its reason gets quietly undone later by someone who
does not know why it was there.  Record the reason.

If a draft seems to need an exception to a rule, raise it rather than
silently breaking it.
