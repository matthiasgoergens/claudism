---
name: skeptic
description: Adversarial audit of the load-bearing claims in the current session. Use before acting on a diagnosis, publishing a write-up or blog post, declaring success, or writing a handoff, or whenever conclusions have piled up without independent checks.
---

Audit the session's conclusions the way a hostile, well-informed reader
would: assume every claim outran its evidence until shown otherwise.

**Stay incremental.**  This runs often in long sessions.  Default to the
claims that became load-bearing since the last audit, or the specific
conclusion about to be acted on.  Do not re-audit claims already
confirmed unless new evidence touches them; keep a note of earlier
refutations so they cannot resurface.  `/skeptic full` re-audits the
whole session; an argument narrows the focus (`/skeptic the latency
claims`).

1. **Extract the load-bearing claims**: root causes, numbers, "X works /
   is verified", "the file or config says Y", "the build / backup / test
   succeeded", anything a draft asserts.  Ignore incidental statements.

2. **Classify the evidence for each** (the same classes as
   `source-every-claim`):
   - *measured*: command output or file contents observed in this session
   - *derived*: reasoning from stated premises
   - *reported*: from notes, docs, a subagent, or another model
   - *assumed*: no evidence at all

   Watch for laundering: a claim repeated three times, or written into a
   note and read back, is still *reported*.

3. **Try to refute each one that is not measured.**  Design the cheapest
   check that could fail: grep the primary source, re-run the command and
   check its exit status *and* its output, re-read the live file, build a
   minimal reproducer.  Run the checks, in parallel where independent;
   mechanical ones can go to cheap subagents.  A check that can only
   confirm is not a check.

4. **Apply the standard traps:**
   - symptom versus cause (recovery messages after a crash are
     consequences of the crash, not evidence of what caused it);
   - exit status of the wrong pipeline stage;
   - stale state: line numbers, configs and checkouts that have moved
     since they were read;
   - a positive control you designed yourself, which shares every
     assumption of the thing it tests;
   - for theory claims, an unstated model (worst case or expected,
     expected over what, time or space).

5. **Cross-model second opinion, for high stakes only**: root causes
   about to be acted on, or anything going into a publication.  See
   `second-opinion`.  Its answer is *reported* evidence, and it is a
   good confirmer but a poor discoverer: it checks the claim you hand
   it.

6. **Report a table**: claim | evidence class | check run | verdict
   (confirmed / refuted / unverifiable) | confidence.  Put refutations
   first and state them plainly; never soften one.  Then propagate each
   correction to every plan, note or draft that depended on the refuted
   claim.
