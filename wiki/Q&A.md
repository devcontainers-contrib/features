## What's the deal with the `check_packages` function in every `install.sh`?

Because these features might install _in any order_ and _on any machine_, we
need to make sure that we have the required packages. In this case, that means
using a `check_packages` function to verify that such a command exists. If it
doesn't, it must be installed.

```sh
check_packages wget
check_packages tar

wget https://example.org/my-package.tgz
tar xzfv my-package.tgz
```

**TL;DR:** `check_packages` is an abstraction to install a package if needed.

## What is `dev-container-features-test-lib`?

It's a shell script that magically appears ✨ in the same working directory when
you run `devcontainer features test`. It contains three functions:

- `check`
- `checkMultiple`
- `reportResults`

It is useful as a rudimentary testing framework.

👨‍💻 Source code: [devcontainers/cli/src/spec-node/featuresCLI/utils.ts] \
🔰 Examples: [devcontainers/cli/docs/features/test.md]

## What does `exec $SHELL` do?

`$SHELL` is an environment variable that contains a string pointing to the
absolute path to the currently invoked shell instance. This is usually something
like `/bin/bash` or `/bin/sh`.

📚 Further reading:
[$SHELL variable - Linux Bash Shell Scripting Tutorial Wiki](https://bash.cyberciti.biz/guide/%24SHELL_variable)

`exec` replaces the current running process with a new process. In this case,
that means replacing the current shell (likely `bash` or `sh`) with another
instance of the same shell.

📚 Further reading:
[exec man page](https://linuxcommand.org/lc3_man_pages/exech.html)

### Why do we need to do this?

Well, it turns out that re-executing the shell also _re-executes the
`~/.bashrc`_. We need to do this to get access to the thing that we actually
installed!

## Is it "devcontainer", "dev container", or "DevContainer"?

Other possibles: "Dev Container", "Devcontainer"

It's "devcontainer" or "devcontainers", but they can be capitalized if it's the
start of a sentence. It isn't a proper noun, so we shouldn't say "Devcontainer".
In fact, it's still in the process of being coelesced into a single word!
Microsoft (the company behind the specification) use "dev containers". It's more
popular to use "devcontainer" than it is to use "dev container", so that's what
we use.

|        | "dev container" | "devcontainer" |
| ------ | --------------- | -------------- |
| GitHub | [6.7K][1]       | [38K][2]       |
| Google | [180K][3]       | [460K][4]      |

[1]: https://github.com/search?l=Markdown&q=%22dev+container%22&type=Code
[2]: https://github.com/search?l=Markdown&q=%22devcontainer%22&type=Code
[3]: https://www.google.com/search?q=dev+container
[4]: https://www.google.com/search?q=devcontainer

## Which [shebang](<https://en.wikipedia.org/wiki/Shebang_(Unix)>) should I use?

- **`#!/bin/sh`:** Use for POSIX scripts
- **`#!/bin/bash`:** Use for Bash scripts
- **`#!/usr/bin/env python3`:** Use for Python scripts
- **`#!/usr/bin/env -S deno run -A`:** Use for Deno scripts
- **`#!/usr/bin/env $YOUR_INTERPRETER`:** Use for any other scripts
- **_none_**: Libraries that are intended to be `source`-ed

## What is that `$__dirname` variable magic?

```sh
__dirname=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)
```

This snippet is taken from
[Minimal safe Bash script template - Better Dev](https://betterdev.blog/minimal-safe-bash-script-template/).
The name `__dirname` is inspired by CommonJS. It is the folder that
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

## How do I run part of a feature as the non-root user?

Many features have install scripts downloaded from external sources that expect
to be executed in the context of a non-root user. By default, feature `install.sh` scripts
are run as the root user. This means that `$HOME` is set to `/root` which  isn't
usually where you want to install things.

devcontainer features provide us with a [`$_REMOTE_USER`] variable that is the username
the developer will use to connect to the terminal environment when they start the devcontainer.
We can use this in combination with [`sudo`] or [`su`] to execute commands as this user.

```sh
su "$_REMOTE_USER" -c "echo Hello!"
```

📖 Example: [devcontainers/features/src/node/install.sh]

[`sudo`]: https://cheat.sh/sudo
[`su`]: https://cheat.sh/su
[`$_REMOTE_USER`]: https://github.com/devcontainers/spec/blob/main/proposals/features-user-env-variables.md
[devcontainers/cli/src/spec-node/featuresCLI/utils.ts]: https://github.com/devcontainers/cli/blob/main/src/spec-node/featuresCLI/utils.ts#L59
[devcontainers/cli/docs/features/test.md]: https://github.com/devcontainers/cli/blob/main/docs/features/test.md
[devcontainers/features/src/node/install.sh]: https://github.com/devcontainers/features/blob/main/src/node/install.sh#L155
