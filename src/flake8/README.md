

# Flake8 (via pipx) (flake8)

Flake8 is a python tool that glues together pycodestyle, pyflakes, mccabe, and third-party plugins.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/flake8:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version of Flake8 to install. | string | latest |
| plugins | A space delimitered list of flake8 plugins (will be injected into the flake8 pipx env). see proposals for examples | string | - |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/devcontainers-contrib/features/blob/main/src/flake8/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
