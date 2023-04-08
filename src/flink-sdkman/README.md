
# Flink (via SDKMAN) (flink-sdkman)

Apache Flink is an open-source, unified stream-processing and batch-processing
framework.It's a distributed processing engine for stateful computations over
unbounded and bounded data streams.It has been designed to run in all common
cluster environments, perform computations at in-memory speed and at any scale.

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/flink-sdkman:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version of Flink to install. | string | latest |
| jdkVersion | Select or enter a JDK version to install. | string | latest |
| jdkDistro | Select or enter a JDK distribution to install | string | ms |


