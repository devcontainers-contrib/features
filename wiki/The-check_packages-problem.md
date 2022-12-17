One of the problems with having 70+ features is that you have to rewrite the
same 3 functions _many_ times. The question is, how do you share the
`check_package` function across many different features so that there's only one
copy of it in source control?

⚠️ **This methodology is not finalized.** See
[#83](https://github.com/devcontainers-contrib/features/discussions/83) for more
details.

**🕗 This is a new feature.** Not all features make use of it yet.

Right now, the way we solve this problem is by copying a well-known folder
called "bash_modules" to every feature. We do this in the
[`prebuild.sh`](https://github.com/devcontainers-contrib/features/blob/main/feature_specs/amplify-cli.yaml)
using `cp` to copy the `bash_modules/` folder to each `src/*/` directory. That
means every feature gets the entire library of features like `check_package`,
`install_nodejs`, and `install_python`.

📛 The name `bash_modules/` was inspired by `node_modules/` which deals with a
similar problem.

This means we can write code that uses the `source` command to import the code
from the `bash_modules/*.sh` files and use functions declared there. And
remember that those functions appear only once in source control.

```sh
#!/bin/bash -e
source bash_modules/check_packages.sh
# curl: Needed in instructions: https://deno.land/manual@v1.28.3/getting_started/installation
# unzip: Needed to unpack it: https://github.com/denoland/deno_install#unzip-is-required
check_packages curl unzip
# https://deno.land/manual@v1.28.3/getting_started/installation
curl -fsSL https://deno.land/x/install/install.sh | sh
```

📚 Further reading:
[bash - What does 'source' do? - Super User](https://superuser.com/a/46146)

You may wonder why we don't use `source ../../bash_modules/*.sh`, right? It
turns out that, when each feature is compiled into a container image, it doesn't
have access to anything outside the `src/*/` folder. That means that the
`install.sh` script cannot import something from it's parent folder. This is why
we need to _copy_ the files into each and every folder just prior to generation.

You'll also note that all of the `bash_modules/*.sh` files are _not executable_.
This is deliberate. These are _library files_ meant to be read and `eval`-ed
with `source` in the context of an _existing shell_. **They therefore should not
be executable.** To fix
[shellcheck(SC2148)](https://www.shellcheck.net/wiki/SC2148), we also add a
`#shellcheck shell=bash` to get correct linting.

📜 You can view the discussion and debate that lead to this implementation in
[#83](https://github.com/devcontainers-contrib/features/discussions/83)
