## Running the tests locally

You can run the test for a specific feature with the following command within
this repo's Dev Container, replacing `angular-cli` with the feature's folder
name:

```
devcontainer features test -f angular-cli -i "mcr.microsoft.com/devcontainers/base:ubuntu"
```

Note that this is based on the GitHub action defined in
`.github/workflows/test.yaml`. If this documentation is out of date, reference
the automated tests and update these instructions to match.
