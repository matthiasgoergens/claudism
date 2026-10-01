# Results

The new allocator is 30% faster on the build benchmark.  Nobody has
ever hit this path in production.

The patch fixes the leak because the error path now drops the reference.
We like the colour of the logo.

```
make -j8   # 8 jobs, not a claim
```
