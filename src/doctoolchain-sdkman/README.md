
# docToolchain (via SDKMAN) (doctoolchain-sdkman)

docToolchain is an implementation of the docs-as-code approach for software
architecture plus some additional automation. The basis of docToolchain is the
philosophy that software documentation should be treated in the same way as code
together with the arc42 template for software architecture.

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/doctoolchain-sdkman:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version of docToolchain to install. | string | latest |
| jdkVersion | Select or enter a JDK version to install. | string | latest |
| jdkDistro | Select or enter a JDK distribution to install | string | ms |


