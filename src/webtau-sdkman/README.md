
# Webtau (via SDKMAN) (webtau-sdkman)

Webtau (short for web test automation) is a testing API, command line tool and a
framework to write unit, integration and end-to-end tests. Tests can span
multiple application layers like REST-API, Graph QL, Browser, Database and CLI.
Consistent set of matchers and testing concepts work across all testing layers.
Use REPL mode to speed-up tests development. Leverage rich reporting to
significantly cut down failure investigation time.

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/webtau-sdkman:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version of Webtau to install. | string | latest |
| jdkVersion | Select or enter a JDK version to install. | string | latest |
| jdkDistro | Select or enter a JDK distribution to install | string | ms |


