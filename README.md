# Devcontainer Community Features

🐳 Extra add-in features for [Devcontainers] and [GitHub Codespaces]

[devcontainers]: https://code.visualstudio.com/docs/devcontainers/containers
[github codespaces]: https://github.com/features/codespaces

<div align="center">

![](https://i.imgur.com/W7t3YsC.png)

**[Docs](https://github.com/devcontainers-contrib/features#readme)**
| [Contributing](https://github.com/devcontainers-contrib/features/blob/main/CONTRIBUTING.md)
| [Dev docs](https://github.com/devcontainers-contrib/features/wiki)

</div>

💻 Works with [Devcontainers] \
☁️ Works with [GitHub Codespaces] \
👨‍🍳 Based on the official [devcontainers/template-starter] project

[devcontainers/template-starter]:
  https://github.com/devcontainers/template-starter#readme

📢 [We are actively seeking contributions!](CONTRIBUTING.md)

## Usage

![Codespaces](https://img.shields.io/static/v1?style=for-the-badge&message=Codespaces&color=181717&logo=GitHub&logoColor=FFFFFF&label=)
![Devcontainers](https://img.shields.io/static/v1?style=for-the-badge&message=Devcontainers&color=2496ED&logo=Docker&logoColor=FFFFFF&label=)

📄 [View the full list of features](src/)

Just add a `.devcontainer/devcontainer.json` file with a `features` key. It's
very similar to NPM's `package.json` and `dependencies` object, just with the
addition of an `options` object.

📚 Make sure to inspect each feature for feature-specific options

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

## Development

![Codespaces](https://img.shields.io/static/v1?style=for-the-badge&message=Codespaces&color=181717&logo=GitHub&logoColor=FFFFFF&label=)
![Devcontainers](https://img.shields.io/static/v1?style=for-the-badge&message=Devcontainers&color=2496ED&logo=Docker&logoColor=FFFFFF&label=)
![Python](https://img.shields.io/static/v1?style=for-the-badge&message=Python&color=3776AB&logo=Python&logoColor=FFFFFF&label=)
![Cookiecutter](https://img.shields.io/static/v1?style=for-the-badge&message=Cookiecutter&color=222222&logo=Cookiecutter&logoColor=D4AA00&label=)

📢 [We are actively seeking contributions!](CONTRIBUTING.md)

This repository is heavily based on the [devcontainers/template-starter]
project. You can find more developer-specific docs on [the Wiki]

[the wiki]: https://github.com/devcontainers-contrib/features/wiki
