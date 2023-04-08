
# Github Release (gh-release)

Github Release feature will download, extract and add to path a release binary from a given repo

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/gh-release:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| repo | Select the version of the github release binary to install. | string | - |
| target | The target binary name. For example, for Github CLI the binary name would be 'gh'. For DigitalOcean CLI: 'doctl', etc. | string | - |
| version | Select the version of the github release binary to install. | string | latest |


