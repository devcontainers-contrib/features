This project uses _a lot_ of `bash` and `sh`. This is an index of snippets and
patterns.

## Which [shebang](<https://en.wikipedia.org/wiki/Shebang_(Unix)>) should I use?

- **`#!/bin/sh`:** Use for POSIX scripts
- **`#!/bin/bash`:** Use for Bash scripts
- **`#!/usr/bin/env python3`:** Use for Python scripts
- **`#!/usr/bin/env $YOUR_INTERPRETER`:** Use for any other scripts
- **_none_**: Libraries that are intended to be `source`-ed

## What is that `$__dirname` variable magic?

```sh
__dirname=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)
```

This snippet is taken from
[Minimal safe Bash script template - Better Dev](https://betterdev.blog/minimal-safe-bash-script-template/).
The name `__dirname` is inspired by CommonJS. It is basically the folder that
contains the `*.sh` file that is running. This is useful for resolving paths
relative to the script itself instead of the current working directory.

> This line does its best to define the script’s location directory, and then we
> cd to it. Why?
>
> Often our scripts are operating on paths relative to the script location,
> copying files and executing commands, assuming the script directory is also a
> working directory. And it is, as long as we execute the script from its
> directory.
>
> --
> [Minimal safe Bash script template - Better Dev](https://betterdev.blog/minimal-safe-bash-script-template/)
