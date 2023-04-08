
# Maven Daemon (via SDKMAN) (mvnd-sdkman)

The mvnd project aims to provide a daemon infrastructure for maven based builds.
It borrows techniques from Gradle and Takari to provide a simple and efficient
system.

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/mvnd-sdkman:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version of Maven Daemon to install. | string | latest |
| jdkVersion | Select or enter a JDK version to install. | string | latest |
| jdkDistro | Select or enter a JDK distribution to install | string | ms |


