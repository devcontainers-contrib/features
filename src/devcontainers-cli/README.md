
# devcontainers CLI (via npm) (devcontainers-cli)

The devcontainers CLI, which configures devcontainers from devcontainer.json. Requires the Docker client and access to a Docker engine socket (e.g. by mounting the host's Docker socket into the container)

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/devcontainers-cli:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install. | string | latest |


