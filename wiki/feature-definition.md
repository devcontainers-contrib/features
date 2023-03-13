# Feature-defintion.json

This is an *extended* version of the [devcontainer-feature.json](https://containers.dev/implementors/features/#devcontainer-feature-json-properties) file with *additional fields*:

See [feature-definition folder](https://github.com/devcontainers-contrib/features/tree/main/feature_definitions) for examples!

## Examples

### Example of including a feature dependency

```yaml
{   
    ...
    regular devcontainer-json fields  like id, name, description etc
    ...


    # dependencies are list of features and options  (those will be installed as prerequisites to your feature)
    "dependencies": [
        {
            "feature": "ghcr.io/devcontainers-contrib/features/asdf-package:latest",
            "options": {
                "plugin": "act",

                "version": "latest"
            }
        }
    ],

    # This command will be executed after the dependency feature list has been installed
    "install_command": "echo 'Done'",

    # this example test scenario checks the default options (empty options dict), each test_command should exit wth code `0` if your feature is installed correctly.
    "test_scenarios": [
        {
            "name": "test_defaults",
            "image": "mcr.microsoft.com/devcontainers/base:debian",
            "test_commands": [
                "act --version"
            ],
            "options": {}
        }
    ]
}
```

### Example of redirecting inputs

```yaml
{
    ...


    "options": {
        "version": {
            "type": "string",
            "default": "latest",
            "description": "Select the version of act to install."
        }
    },

    # you can also redirect one of your actual devcontainer-feature.json options values into a dependency input, note the `$options.version` pointer to the asdf-package version option
    "dependencies": [
        {
            "feature": "ghcr.io/devcontainers-contrib/features/asdf-package:latest",
            "options": {
                "plugin": "act",
                "version": "$options.version"
            }
        }
    ],

    ...
}
```
