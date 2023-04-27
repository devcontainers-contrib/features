
# Flake8 (via pipx) (flake8)

Flake8 is a python tool that glues together pycodestyle, pyflakes, mccabe, and third-party plugins.

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/flake8:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install. | string | latest |
| plugins | A space delimitered list of flake8 plugins (will be injected into the flake8 pipx env). see proposals for examples | string | - |


