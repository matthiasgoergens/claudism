| # | claim | triggers | class | source |
|---|-------|----------|-------|--------|
| 1 | Bare file names are checked. | verification | measured | missing.txt |
| 2 | Windows paths are checked. | verification | measured | C:\Users\Alice\missing.log |
| 3 | Paths with spaces are found. | verification | measured | artefacts/run with space.txt |
| 4 | URLs and hashes are not file paths. | verification | reported | https://example.org/a/b.txt, b6923f2 |
