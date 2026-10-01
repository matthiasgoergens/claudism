# What changed, and why

<!-- llm-isms: off -->

A trial run of the claudism skill packs on "Quant Quriosity - The Quant
Quarter: Q3 2026" (LinkedIn, Harry D Singh,
https://www.linkedin.com/pulse/quant-quriosity-quarter-q3-2026-harry-d-kh83c/),
as LinkedIn served it on 2026-10-01.  `quant-quarter-q3-2026.md` is the
edit.

## Mechanical findings

`llm-isms` on the original: 5 hits in the default set, and in `--strict`
mode 8 rhetorical shapes in 752 words (10.6 per 1000; one author's
edited blog prose runs at 0.7).  On the edit: 0 and 0.  That second
result is weak evidence, because the same agent wrote the patterns and
the edit; the fact-check and a fresh reader were the real tests.

## Punctuation that went missing

In three places the public text reads as if dashes were deleted without
rewording: "Arrowpoint Investment Partners an Asia pod shop had taken",
"Maso Capital Partners a local operator", "no longer a sidecar they're
competing", and "One IFC in Hong Kong a new floor".  Deleting em-dashes
is not enough; the sentence has to be rebuilt (commas, a colon, or two
sentences).  It is possible LinkedIn dropped them rather than the
author; the raw HTML has no character there either way.

## The tics, and what replaced them

| Original | Problem | Revision |
|----------|---------|----------|
| "The people moved first. The offices followed. Everything else in the quarter was downstream of those two facts." | staccato opener plus a sweeping claim no one can check ("everything else") | "This quarter's top stories in Asian quant were a whole team changing firms and the market makers' expansion in Hong Kong." |
| "The detail that matters: that team ran roughly $1bn" | colon reveal | the number, stated |
| "Six people, an intact strategy, and a regional leader moved as a unit." | triplet for rhythm | folded into the sentence about the sale |
| "The trigger was corporate, not personal." | "X, not Y" antithesis, presented as fact but it is an inference | "A change of owner is a natural moment for a team to leave" |
| "If you take one thing from this quarter, take that. The most valuable asset ... isn't an individual researcher. It's a functioning team" | announced significance, "isn't X. It's Y" reversal | "My read: ..." (labelled as opinion, since it is one) |
| "That's the tell." | announced significance | cut |
| "buying someone who already knows the market, not exporting a template" | antithesis, and an inference from one hire | cut; the hire is stated |
| "Three patterns worth naming" | stock heading; two of the three "patterns" rested on a single hire each | "Other moves", with the hires stated |
| "Boomerangs are back." / "the bench is tight" | punch line, then an unsourced inference from one rehire | the rehire, stated |
| "Banks build the relationships ...; the platforms monetise them at higher margins." | unsourced general claim in the voice of fact | cut |
| "Then the offices" / "The money kept coming" | teaser headings | "Offices", "Revenues and flows" |
| "The leasing followed the hiring, which is the right order." | verdict instead of report | cut |
| "so this is expansion, not reallocation" | antithesis | "doubling its office space there", as the source puts it |
| "Three of the world's largest market makers reached the same conclusion in the same quarter." | parallel for effect; also claims to know their reasoning | "The expansion comes as Hong Kong's IPO market and trading volumes pick up." |
| "the retail tailwind lifted the cohort rather than one firm" | inference stated as fact | cut; the revenue facts stand alone |
| "which is exactly why it isn't a pod shop" | clincher | cut |
| "Arrowpoint proved the model works in Asia, and every platform CIO read that story." | overclaim ("proved", "every") | "Arrowpoint has shown that one can be done in Asia." |
| "One ask." / "Half the value of writing this is what comes back." | punch paragraph, aphorism closer | a plain request to reply |
| "rather be corrected than confidently wrong" | kept, minus "confidently": the author's own line | |

## Facts

`factcheck.md` lists every checkable claim with a verdict and a source
(Bloomberg itself returned 403, so Bloomberg items rest on Hedgeweek's
coverage and Bloomberg URL dates).  Of 31 claims: 16 verified, 2 wrong,
5 overstated, 8 opinion.  The items marked (*) were re-checked by
fetching the source directly; the rest rest on the fact-check agent's
reading.

| Original | Finding | Revision |
|----------|---------|----------|
| Khandelwal's move to Millennium, paired with Stead as "same bank, same quarter" | Wrong: Hedgeweek dates the Khandelwal hire 12 April 2023 (*).  The page was re-created on the site in August 2026, which may be how it got into a Q3 roundup. | dropped, along with the "banks are the feeder" pattern it supported |
| "UBS sold O'Connor ... last year ... eighteen months later" | Inconsistent: a 2025 sale cannot be eighteen months before August 2026 unless it was before February 2025 | "last year" kept, "eighteen months" dropped |
| "UBS sold O'Connor, roughly $11bn, to Cantor" | Reads as a price; $11bn is what O'Connor managed (*) | "managed about $11bn at the time of the sale" |
| "Citadel brought Matt Giannini back" | He "is expected to join Citadel in 2027" (*) | "is rehiring ... expected to start in 2027" |
| "Jane Street now holds more than 110,000 square feet across six floors" | Second-hand and originally from 2025, not a Q3 development | "has reportedly grown to" |
| Chris Drew, "Jump Trading's digital-asset trading chief" | His title was head of London digital-asset trading at Jump Crypto | "formerly of Jump Trading's digital-asset business" |
| Citadel Securities "$11.6bn revenue and $5.2bn net income in H1" | Correct as the sum of two quarterly figures for trading revenue, not a reported half-year number | "trading revenue for the first two quarters adds up to" |
| Quantedge "managing $7.2bn" | Reports differ ($7.2bn and $6bn) | "$6bn to $7bn (reports differ)" |
| "On 5 September, Jump Trading took ...", Citadel Securities' share of US retail trades, Quantedge's volatility target | 5 September is Bloomberg's report date; the other two rest on search summaries only | "Bloomberg reported that ...", "is reported to" |
| "the retail tailwind lifted the cohort", "every platform CIO read that story", "Banks build the relationships ...", "Three of the world's largest market makers reached the same conclusion" | Opinion or motive presented as fact, no source | cut, or kept under "My read" |

<!-- llm-isms: on -->
