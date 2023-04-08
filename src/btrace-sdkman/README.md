
# BTrace (via SDKMAN) (btrace-sdkman)

BTrace is a safe, dynamic tracing tool for the Java platform. BTrace can be used
to dynamically trace a running Java program (similar to DTrace for OpenSolaris
applications and OS). BTrace dynamically instruments the classes of the target
application to inject bytecode tracing code.

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/btrace-sdkman:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version of BTrace to install. | string | latest |
| jdkVersion | Select or enter a JDK version to install. | string | latest |
| jdkDistro | Select or enter a JDK distribution to install | string | ms |


