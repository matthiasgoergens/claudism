# Trial run: The Quant Quarter, Q3 2026

This branch is not part of the skill packs.  It records one trial of
them on a real piece of writing: Harry D Singh's LinkedIn newsletter
"Quant Quriosity - The Quant Quarter: Q3 2026"
(https://www.linkedin.com/pulse/quant-quriosity-quarter-q3-2026-harry-d-kh83c/).
The text and the views in it are his; the edit is a suggestion.

- `quant-quarter-q3-2026.md`: the edited newsletter.
- `CHANGES.md`: every change and the reason for it, the style changes
  first, then the fact corrections.
- `factcheck.md`: each checkable claim in the original, with a verdict
  and the public source it was checked against.

What was run, in order: `llm-isms` (and `--strict`), `claim-ledger` to
list the 20 checkable sentences, a fact-check of each against public
sources, a hand edit following the `llm-isms` and `source-every-claim`
skills, and a fresh-reader pass on the edit by an agent that saw only
the edited text.

What it found that a style pass alone would not have: one hire reported
as news this quarter was from April 2023, a "last year ... eighteen
months later" timeline that cannot both be true, a fund's assets that
read as a sale price, and a rehire that has been announced but takes
effect in 2027.
