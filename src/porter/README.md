
# Porter (via porter.sh) (porter)

Porter enables you to package your application artifact, client tools, configuration and deployment logic together as an installer that you can distribute, and install with a single command.

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/porter:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version to install. | string | latest |
| terraformMixinVersion | Select the terraform mixin version to install. | string | latest |
| azMixinVersion | Select the az mixin version to install. | string | latest |
| awsMixinVersion | Select the aws mixin version to install. | string | latest |
| dockerMixinVersion | Select the docker mixin version to install. | string | latest |
| dockerComposeMixinVersion | Select the docker-compose mixin version to install. | string | latest |
| gcloudMixinVersion | Select the gcloud mixin version to install. | string | latest |
| helmMixinVersion | Select the helm mixin version to install. | string | latest |
| armMixinVersion | Select the arm mixin version to install. | string | latest |
| azurePluginVersion | Select the azure plugin version to install. | string | latest |
| kubernetesPluginVersion | Select the kubernetes plugin version to install. | string | latest |


