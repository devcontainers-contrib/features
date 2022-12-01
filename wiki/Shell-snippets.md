This project uses _a lot_ of `bash` and `sh`. This is an index of snippets and patterns.

## Which [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)) to use

- **`#!/bin/sh`:** Use for POSIX scripts
- **`#!/bin/bash`:** Use for Bash scripts
- **`#!/usr/bin/env python3`:** Use for Python scripts
- **`#!/usr/bin/env $YOUR_INTERPRETER`:** Use for any other scripts
- **_none_**: Libraries that are intended to be `source`-ed
