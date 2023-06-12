
# Prometheus Pushgateway (via Github Releases) (pushgateway)

The Prometheus Pushgateway exists to allow ephemeral and batch jobs to expose their metrics to Prometheus. Since these kinds of jobs may not exist long enough to be scraped, they can instead push their metrics to a Pushgateway. The Pushgateway then exposes these metrics to Prometheus.

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/pushgateway:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install. | string | latest |


