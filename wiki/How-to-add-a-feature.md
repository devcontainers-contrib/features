## A Handcrafeted Feature

- Add a feature-id named directory to
  the [src folder](https://github.com/devcontainers-contrib/features/blob/main/src) containing
  your `devcontainer-feature.json` and `install.sh` scripts
- Add the corresponsing test.sh to
  the [test folder](https://github.com/devcontainers-contrib/features/blob/main/tests)

## Easly Generated Feature

Get the devcontainer-contrib cli

```source-shell
pip install devcontainer-contrib
```

Add a
new [`devcontainer-definition.json`](https://github.com/devcontainers-contrib/cli#readme) file
to
the [feature_definition dir](https://github.com/devcontainers-contrib/features/blob/main/feature_definitions)

While under the root folder of this repo, generate it using the command:

```source-shell
devcontainer-contrib features generate "./feature_definition/your-feature-id/feature-definition.json" "." --output-type=feature_dir
```

[Additional information and docs about the CLI and devcontainer-definition.json file](https://github.com/devcontainers-contrib/cli#readme)
