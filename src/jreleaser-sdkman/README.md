
# JReleaser (via SDKMAN) (jreleaser-sdkman)

JReleaser is a release automation tool for Java projects. Its goal is to
simplify creating releases and publishing artifacts to multiple package managers
while providing customizable options.

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/jreleaser-sdkman:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version of JReleaser to install. | string | latest |
| jdkVersion | Select or enter a JDK version to install. | string | latest |
| jdkDistro | Select or enter a JDK distribution to install | string | ms |


