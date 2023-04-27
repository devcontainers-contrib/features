
# GroovyServ (via SDKMAN) (groovyserv-sdkman)

GroovyServ reduces startup time of the JVM for runnning Groovy significantly. It
depends on your environments, but in most cases, it’s 10 to 20 times faster than
regular Groovy.

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/groovyserv-sdkman:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install. | string | latest |
| jdkVersion | Select or enter a JDK version to install. | string | latest |
| jdkDistro | Select or enter a JDK distribution to install | string | ms |


