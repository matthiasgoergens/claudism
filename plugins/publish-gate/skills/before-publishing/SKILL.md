---
name: before-publishing
description: The order of checks for any prose that will leave the machine under the user's name (blog posts, GitHub issues, PRs and comments, mailing-list mail, Slack, email), and the rules for handing it over. Use whenever a draft is about to be shown to the user for sending, or before anything is posted on their behalf.
---

Text published under someone's name cannot be taken back, and a
maintainer, colleague or reader who notices machine-written prose stops
extending good faith to its content.  One person's experience: twelve
comments in four hours across five threads, including a claim, its
retraction, and the retraction's retraction, ended with the maintainer
asking whether an AI was writing the posts.  The substance held up; the
delivery did the damage.  Two rules follow, and they are the actual fix.

**Nothing goes out until it has survived a refutation attempt.**  The
checks that caught the two wrong claims in that episode ran after
posting.  Run them before.

**Findings accumulate into one post**, rather than arriving as a stream
of corrections.  If a new finding arrives after posting, batch it with
whatever else is pending; do not reply to yourself.

## Order of checks

Run the ones whose skills are installed, in this order, so the user only
ever reads text that has passed all of them.  Showing a draft and then
fixing it doubles their reading.

1. **House style** (`house-style`): apply the user's recurring edits.
2. **Tics** (`llm-isms`): mechanical checker, then the judgement checks.
3. **Claims** (`source-every-claim`): ledger, artefacts, overclaims.
   For a defect report: a runnable positive trigger, not just a reading.
4. **Mechanical leaks** (this skill's `leak-check`):

       <this skill's directory>/leak-check --medium github|mail|blog [--repo DIR] DRAFT

   Local paths, local-only commit hashes, your internal words, and
   wrapping that is wrong for the medium.
5. **Fresh reader** (`fresh-reader`): an independent agent with only
   the reader's context.
6. **Refutation** (`second-opinion`, `skeptic`): for anything making
   claims, a different model family tries to refute the load-bearing
   ones.  Re-run after the final edits: fixes introduce new holes.
7. **Re-verify live state** on the day of publication: is the PR still
   open, the bug still unfixed, the number still current, the link still
   alive, the recipient address still valid?

## Handing it over

- **Show the complete text before it is posted**, every time, without
  being asked.  An instruction to *compose* ("reply in the thread",
  "answer them") is not an instruction to *send*.
- Put drafts somewhere the user can find them later (a review folder in
  the project's notes, with a status table), not only in chat.
- Never post, dismiss reviews, resolve discussions or mark threads as
  answered on the user's behalf without explicit permission for that
  specific action.  Those are statements about other people's work.

## Content rules that are about the venue, not the prose

- No local-only identifiers: hashes that exist only on this machine,
  paths, run or agent names.  Refer to sent work by subject or public
  link.
- No process narration ("after independent adversarial review by two
  model families ...").  Keep the verification record in your notes and
  produce it if a reviewer asks.
- Code comments: no history, no "the fix", no dates, no review rounds.
- AI disclosure: follow the venue's policy if it has one.  Otherwise
  follow the user's preference; do not add attribution trailers they
  have not asked for.
- Corrections: once, plainly, where the original readers will see it.
