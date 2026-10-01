# House style

<!-- llm-isms: off -->

Copy to ~/.config/house-style.md and make it yours: delete what you
disagree with, and let the agent add to it each time you correct a
draft.  Each rule records when and why it was added, so nobody quietly
undoes it later.  These starter rules came from one person's
corrections of model-written drafts for open-source maintainers and a
blog; they are examples, not law.

## Form

- Spelling: pick one variety (for example British: -ise, -our, -re) and
  apply it to your own prose only, never to code identifiers, API names
  or quoted output.
- Sentence spacing, greeting and sign-off: write down yours, e.g.
  "Thanks,\nAlex".  Avoid saying "thanks" three times in six lines.
- Wrap for the medium: hard-wrap plain-text mail at about 72 columns;
  do not hard-wrap GitHub comments, issues or PR descriptions.
- Decide whose voice a post is in and set it in the first sentence.
  Addressing the reader directly is fine, but do it from the start, not
  by slipping into "you" halfway down an impersonal report.
- PR descriptions start with the summary prose itself, with no
  "Summary" heading, and use prose rather than bullet lists.
- Never put commit hashes in backticks on GitHub: a bare hash is linked
  automatically, a backticked one is not.

## Tone

- Just do; don't mirror.  Do not echo the reader's point back or narrate
  plans at length.  Thank briefly, state the next action in one
  sentence, ask any open question, stop.
- No pushy requests ("please merge this before the release").  State
  the facts; the reader draws the conclusion.
- No unmotivated reassurance ("there's no hurry").  If a sentence needs
  a reason and there is no honest one, drop it.
- Don't ask what the reader already answered.  If they suggested an
  approach, do it and say so in a clause.
- A bullet asking for a decision ends in a question mark.
- One request per message when something is urgent.
- No "found by" flourishes, unless the reader gains something: credit,
  a reproducer, or the fact that it hit a real user.
- When an earlier claim was wrong, say so once, plainly, and move on.

## Length

- Tighten before showing: say each thing once, answer first and give the
  reason second, collapse call chains and per-case breakdowns into the
  sentence the reader needs, and link the rest.  A third shorter with
  nothing lost is a typical result.
- Findings accumulate into one post rather than arriving as a stream of
  corrections.  Twelve comments in four hours, including a claim, its
  retraction and the retraction's retraction, once prompted a
  maintainer to ask whether an AI was writing the posts.  The substance
  was right; the delivery did the damage.

## Content hygiene

- No local-only identifiers: local commit hashes, worktree or home
  paths, run names, agent or model names.  Refer to a sent patch by its
  subject or a public link.
- Reproducers: include them, don't offer them.  Short ones inline;
  longer ones in a public repository, linked.
- New thread for each new version of a patch or proposal unless asked
  otherwise; replies are for replies.
- Answer bot reviews, even if only to say briefly why a finding is
  wrong.
- Prefer following prior art when proposing a design, and name it.
- Don't add AI attribution trailers or "generated with" footers unless
  the project requires them.

<!-- llm-isms: on -->
