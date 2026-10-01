# Measurements behind the numbers in the README

<!-- llm-isms: off -->

Measured on 2026-10-01 with this repository's `llm-isms` as of the
commit that added this file, and no personal patterns file
(`LLM_ISMS_PATTERNS=/dev/null`).

## Edited blog prose: 0.7 per 1000 words

Corpus: the 23 posts in `content/posts/` (excluding `_index.md`) of
https://github.com/matthiasgoergens/paquari at commit
f01d4f9d49375cbf59aa0aef1f77fa64269af513, 42,192 words in total.  The
author had already removed model-prose tells from these posts by hand
(commit 173a3cf in that repository).

    $ cd paquari/content/posts
    $ LLM_ISMS_PATTERNS=/dev/null llm-isms --strict $(ls *.md | grep -v '^_')
    ...
    359 flagged
    28 to consider in 42192 words (0.7 per 1000)
    29 nested sentences (0.7 per 1000)

Of the 359 default-set hits, 349 are em-dashes, which this author uses
on purpose (hence `disable<TAB>em-dash` in the patterns file).  The
other 10: "byte-identical" three times, "the most interesting part" and
similar twice, and one each of "to be honest", "earned its keep", "the
very", "which is exactly why" and "load-bearing".

The lines that commit 173a3cf removed produce 67 default-set hits; the
lines it added produce 8, all em-dashes.

## A LinkedIn newsletter: 10.6 per 1000 words

"Quant Quriosity - The Quant Quarter: Q3 2026", a 752-word LinkedIn
newsletter, as served on 2026-10-01:

    5 flagged
    8 to consider in 752 words (10.6 per 1000)
    0 nested sentences (0.0 per 1000)

The edited version (branch `trial/quant-quarter-q3-2026` of this
repository) gives 0 and 0, but that is not independent evidence: it was
edited by the same agent that wrote the patterns.  The fact-check and
fresh-reader passes on that branch are the better test.

## Reviewer corpora

`tests/llm-isms/review-good.md` and `review-bad.md` were written by a
second model asked to break the checker: good sentences that should not
fire, and stock model phrases that should.  Both are now part of
`tests/run.sh`.  The reviewer's two other good sentences ("byte-identical"
for a signed artefact, "the story gets more interesting when you
compare") still fire, deliberately.

<!-- llm-isms: on -->
