
# MkDocs (via pipx) (mkdocs)

MkDocs is a fast, simple and downright gorgeous static site generator that's geared towards building project documentation.

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/mkdocs:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install. | string | latest |
| plugins | A space delimitered list of mkdocs plugins (will be injected into the mkdocs pipx env). see proposals for example | string | mkdocs-material |


