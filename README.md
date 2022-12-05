# Community devcontainer features

[![Gitter](https://img.shields.io/gitter/room/devcontainers-contrib/community)](https://gitter.im/devcontainers-contrib/community)

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
👨‍🍳 Based on the official
[devcontainers/template-starter](https://github.com/devcontainers/template-starter#readme)
project

📢 [We are actively seeking contributions!](CONTRIBUTING.md)

## Usage

![Codespaces](https://img.shields.io/static/v1?style=for-the-badge&message=Codespaces&color=181717&logo=GitHub&logoColor=FFFFFF&label=)
![Devcontainers](https://img.shields.io/static/v1?style=for-the-badge&message=Devcontainers&color=2496ED&logo=Docker&logoColor=FFFFFF&label=)

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
    "ghcr.io/devcontainers-contrib/features/conan:latest": {},
    "ghcr.io/devcontainers-contrib/features/bikeshed:latest": {}
  }
}
```

**💡 Pro tip:** You can use a string instead of an object as a shortcut to
`{ "version": "<your string>" }`!

```json
{
  "features": {
    "ghcr.io/devcontainers-contrib/features/deno:latest": "1.24.0",
    "ghcr.io/devcontainers-contrib/features/pulumi:latest": "3.48.0"
  }
}
```

## Development

![Codespaces](https://img.shields.io/static/v1?style=for-the-badge&message=Codespaces&color=181717&logo=GitHub&logoColor=FFFFFF&label=)
![Devcontainers](https://img.shields.io/static/v1?style=for-the-badge&message=Devcontainers&color=2496ED&logo=Docker&logoColor=FFFFFF&label=)
![Python](https://img.shields.io/static/v1?style=for-the-badge&message=Python&color=3776AB&logo=Python&logoColor=FFFFFF&label=)
![Cookiecutter](https://img.shields.io/static/v1?style=for-the-badge&message=Cookiecutter&color=222222&logo=Cookiecutter&logoColor=D4AA00&label=)

📢 [We are actively seeking contributions!](CONTRIBUTING.md)

This repository is heavily based on the
[devcontainers/template-starter](https://github.com/devcontainers/template-starter#readme)
project. You can find more developer-specific docs on
[the Wiki](https://github.com/devcontainers-contrib/features/wiki)
