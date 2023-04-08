
# CXF (via SDKMAN) (cxf-sdkman)

Apache CXF is an open source services framework. CXF helps you build and develop
services using frontend programming APIs, like JAX-WS and JAX-RS. These services
can speak a variety of protocols such as SOAP, XML/HTTP, RESTful HTTP, or CORBA
and work over a variety of transports such as HTTP, JMS or JBI.

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/cxf-sdkman:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version of CXF to install. | string | latest |
| jdkVersion | Select or enter a JDK version to install. | string | latest |
| jdkDistro | Select or enter a JDK distribution to install | string | ms |


