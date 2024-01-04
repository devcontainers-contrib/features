
# Visual Studio Code Server (vscode-server)

Visual Studio Code Server (official Microsoft build), which hosts Visual Studio Code via HTTP

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/vscode-server:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Specify the Visual Studio Code Server version to install; or "latest"; or "commit:&lt;hash&gt;" | string | latest |

## Launch

Run `code-server`, passing `--accept-server-license-terms` if you have reviewed the [Visual Studio Code Server License Terms](https://aka.ms/vscode-server-license) and the [Microsoft Privacy Statement](https://privacy.microsoft.com/en-US/privacystatement). By default, Visual Studio Code Server listens on port 8000, which you may access via, e.g., [port forwarding in desktop Visual Studio Code](https://code.visualstudio.com/docs/devcontainers/containers#_temporarily-forwarding-a-port) or [Tailscale serve](https://tailscale.com/kb/1312/serve). Run `code-server --help` to see all options.
