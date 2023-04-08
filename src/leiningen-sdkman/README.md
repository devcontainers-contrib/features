
# Leiningen (via SDKMAN) (leiningen-sdkman)

Leiningen is the easiest way to use Clojure. With a focus on project automation
and declarative configuration, it gets out of your way and lets you focus on
your code.

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/leiningen-sdkman:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version of Leiningen to install. | string | latest |
| jdkVersion | Select or enter a JDK version to install. | string | latest |
| jdkDistro | Select or enter a JDK distribution to install | string | ms |


