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

## Why is the project structured the way it is?

TODO: Answer "Why is the project structured the way it is?"

## What is `dev-container-features-test-lib`?

It's a shell script that magically appears ✨ in the same working directory
when you run `devcontainer features test`. It contains three functions:
- `check`
- `checkMultiple`
- `reportResults`

It is useful as a rudimentary testing framework.

## What does `exec $SHELL` do?

`$SHELL` is an environment variable that contains a string pointing to the
absolute path to the currently invoked shell instance. This is usually something
like `/bin/bash` or `/bin/sh`.

📚 Further reading: [$SHELL variable - Linux Bash Shell Scripting Tutorial Wiki](https://bash.cyberciti.biz/guide/%24SHELL_variable)

`exec` replaces the current running process with a new process. In this case,
that means replacing the current shell (likely `bash` or `sh`) with another
instance of the same shell.

📚 Further reading: [exec man page](https://linuxcommand.org/lc3_man_pages/exech.html)

### Why do we need to do this?

Well, it turns out that re-executing the shell also _re-executes the
`~/.bashrc`_. We need to do this to get access to the thing that we actually
installed!
