# Visual Studio Code CLI (vscode-cli)

[Visual Studio Code CLI](https://code.visualstudio.com/docs/editor/command-line) (official Microsoft build), which manages the Visual Studio Code Server and `vscode.dev` tunnels.

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/vscode-cli:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Specify the Visual Studio Code CLI version to install; or "latest"; or "commit:&lt;hash&gt;" | string | latest |

---

## Launch

Run `code serve-web` to download and run Visual Studio Code Server listening on port 8000; or run `code tunnel` to start a `vscode.dev` tunnel. Commands that require a full desktop installation of Visual Studio Code will not work.
