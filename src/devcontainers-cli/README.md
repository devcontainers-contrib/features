
# devcontainers CLI (devcontainers-cli)

The [devcontainers CLI](https://github.com/devcontainers/cli), which configures devcontainers from `devcontainer.json`. Requires the Docker client and access to a container engine daemon socket (e.g. by mounting the host's Docker socket into the container)

## Example devcontainers CLI Usage

```json
"features": {
    "ghcr.io/devcontainers/features/docker-outside-of-docker:1": {},
    "ghcr.io/devcontainers-contrib/features/devcontainers-cli:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Specify the version to install | string | latest |
