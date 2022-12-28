# Community devcontainer features

[![Gitter](https://img.shields.io/gitter/room/devcontainers-contrib/community?style=for-the-badge&logo=appveyor)](https://gitter.im/devcontainers-contrib/community)
![Codespaces](https://img.shields.io/static/v1?style=for-the-badge&message=Codespaces&color=181717&logo=GitHub&logoColor=FFFFFF&label=)
![Devcontainers](https://img.shields.io/static/v1?style=for-the-badge&message=Devcontainers&color=2496ED&logo=Docker&logoColor=FFFFFF&label=)
![Python](https://img.shields.io/static/v1?style=for-the-badge&message=Python&color=3776AB&logo=Python&logoColor=FFFFFF&label=)

🐳 Extra add-in features for
[devcontainers](https://code.visualstudio.com/docs/devcontainers/containers) and
[GitHub Codespaces](https://github.com/features/codespaces)

<div align="center">

![](https://i.imgur.com/W7t3YsC.png)

**[Overview](https://github.com/devcontainers-contrib/features#readme)** |
[User docs](https://github.com/devcontainers-contrib/features#usage) |
[Contributing](https://github.com/devcontainers-contrib/features/blob/main/CONTRIBUTING.md)
| [Developer wiki](https://github.com/devcontainers-contrib/features/wiki)

</div>

💻 Works with
[devcontainers](https://code.visualstudio.com/docs/devcontainers/containers) \
☁️ Works with [GitHub Codespaces](https://github.com/features/codespaces) \

📢 [We are actively seeking contributions!](CONTRIBUTING.md)


## Contributing guide😊

## A Handcrafeted Feature

- Add a feature-id named directory to the [src folder](src/) containing  your `devcontainer-feature.json` and `install.sh` scripts
- Add the corresponsing test.sh to the [test folder](tests/)

## An Easly Generated Feature

Get the devcontainer-contrib cli 
```shell 
pip install devcontainer-contrib
```

Add a new `devcontainer-definition.json` file to the [feature_definition dir](feature_definitions/) (look in it for some examples 😀)

While under the root folder of this repo, generate it using the command:
```shell
devcontainer-contrib features generate "./feature_definition/your-feature-id/feature-definition.json" "." --output-type=feature_dir
```

[Additional information and docs about the CLI and devcontainer-definition.json file](https://github.com/devcontainers-contrib/cli#readme)


## Usage


📄 [View the full list of features](src/)

Just add a `.devcontainer/devcontainer.json` file with a `features` key. It's
very similar to NPM's `package.json` and `dependencies` object, just with the
addition of an `options` object.

📚 Make sure to inspect each feature for feature-specific options \
⚠️ We only officially support [debian](https://hub.docker.com/_/debian)-based images

```json
{
  "image": "mcr.microsoft.com/devcontainers/universal:linux",
  "features": {
    "ghcr.io/devcontainers-contrib/features/deno:latest": {},
    "ghcr.io/devcontainers-contrib/features/mkdocs:latest": {},
    "ghcr.io/devcontainers-contrib/features/bikeshed:latest": {}
  }
}
```

## You can find more developer-specific docs on the [Wiki!](https://github.com/devcontainers-contrib/features/wiki) (thank you [@jcbhmr](https://github.com/jcbhmr)!)
