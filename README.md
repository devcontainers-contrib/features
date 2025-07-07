# Extra Dev Container Features

> [!IMPORTANT]
> This fork was created because the original `devcontainers-contrib` creator deleted the account. This repo was generously created and hosted by [@NathanCYee](https://github.com/NathanCYee) in the dev container community to avoid any accidental or malicious rehosting of these Features, and [`devcontainers-extra`](https://github.com/devcontainers-extra/features) was also generously created and continues to be hosted by the community to continue publishing these Features as well.
>
> As maintainers of the official Dev Containers Spec became aware of [this issue](https://github.com/microsoft/vscode-remote-release/issues/11046), additional steps have now been taken:
> * [Update the dev container CLI](https://github.com/devcontainers/cli/pull/1044) to automatically redirect from `devcontainers-contrib` to `devcontainers-extra`
> * Show a warning in VS Code and GitHub Codespaces about the state of `devcontainers-contrib` and redirection to `devcontainers-extra` (to ensure users are aware and `devcontainers-extra` gets proper credit)
>
> If you experience any additional issues, please notify the Dev Containers Spec maintainers via an issue in the [dev container CLI repo](https://github.com/devcontainers/cli).

🐳 Extra add-in features for
[devcontainers](https://code.visualstudio.com/docs/devcontainers/containers) and
[GitHub Codespaces](https://github.com/features/codespaces)

👀 Don't see your feature here? [🔥 Suggest a new feature! 🔥](https://github.com/devcontainers-extra/features/issues/new?template=suggest-feature.yaml) or [📄 Learn how to add one! 📄](CONTRIBUTING.md) \
🔍 Found a bug? [🐞 Open a bug report! 🐞](https://github.com/devcontainers-extra/features/issues/new?template=feature-bug-report.yaml)

## About This Fork

This repository is a continuation of the [devcontainers-contrib/features](https://github.com/devcontainers-contrib/features) project, initially developed by [danielbraun89](https://github.com/danielbraun89). The fork was created to maintain and enhance the project due to inactivity in the original repository.

> [!NOTE]
> This project is not officially associated with or endorsed by the official [Devcontainers](https://containers.dev/) project

## Usage

Just add a `.devcontainer/devcontainer.json` file with a `features` key. It's
very similar to `package.json`'s `dependencies` object, just with the addition
of an `options` object.

📚 Make sure to inspect each feature for feature-specific options!

```json
{
  "image": "mcr.microsoft.com/devcontainers/base:bookworm",
  "features": {
    "ghcr.io/devcontainers-extra/features/deno": {},
    "ghcr.io/devcontainers-extra/features/neovim": {}
  }
}
```

Then, after adding your devcontainer config file, you can open it in GitHub
Codespaces, or \[open it locally using VS Code\]. Be warned some features will
compile things from source code and may take a while!

<div align="center">

![](https://i.imgur.com/JMdowst.png)

</div>
