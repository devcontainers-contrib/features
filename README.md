<div align="center">

 # [List of features](https://github.com/devcontainers-contrib/features/tree/main/src) 

👀 Don't see your feature here? 

 ## [🔥Suggest a new feature!🔥](https://github.com/devcontainers-contrib/features/issues/new?template=suggest-feature.yaml) 

</div>

<div align="center">

![](https://i.imgur.com/VgiY81S.png)

</div>

## Usage

![VS Code](https://img.shields.io/static/v1?style=for-the-badge&message=VS+Code&color=007ACC&logo=Visual+Studio+Code&logoColor=FFFFFF&label=)
![Codespaces](https://img.shields.io/static/v1?style=for-the-badge&message=Codespaces&color=181717&logo=GitHub&logoColor=FFFFFF&label=)
![Devcontainers](https://img.shields.io/static/v1?style=for-the-badge&message=Devcontainers&color=2496ED&logo=Docker&logoColor=FFFFFF&label=)

Just add a `.devcontainer/devcontainer.json` file with a `features` key. It's
very similar to `package.json`'s `dependencies` object, just with the addition
of an `options` object.

📚 Make sure to inspect each feature for feature-specific options!

```json
{
  "image": "mcr.microsoft.com/devcontainers/universal",
  "features": {
    "ghcr.io/devcontainers-contrib/features/deno:": {},
    "ghcr.io/devcontainers-contrib/features/neovim": {}
  }
}
```

Then, after adding your devcontainer config file, you can open it in GitHub
Codespaces, or [open it locally using VS Code]. Be warned some features will
compile things from source code and may take a while!

<div align="center">

![](https://i.imgur.com/JMdowst.png)

</div>

### Found a bug?

[🐞Open an bug report!🐞](https://github.com/devcontainers-contrib/features/issues/new?template=bug-report.yaml)
