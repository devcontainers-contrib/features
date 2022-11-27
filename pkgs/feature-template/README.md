# Devcontainers cookiecutter

currently supports:

* pipx based features
* apt-get based features
* npm based features

## Dependencies
### cookiecutter:

`pipx install cookiecutter`

### shfmt:

`pipx install shfmt-py`

(or any other [installation method](https://github.com/mvdan/sh))
## Example to create the premade mkdocs feature spec

mkdocs uses pipx + multiple injections

```sh
git clone https://github.com/devcontainers-contrib/features

cookiecutter ./features/pkgs/feature-template --overwrite-if-exists --no-input --config-file ./features/feature_specs/mkdocs.yaml
```

## Example to create the premade localstack feature spec

localstack uses pipx + a mandatory apt-get package

```sh
git clone https://github.com/devcontainers-contrib/features

cookiecutter ./features/pkgs/feature-template --overwrite-if-exists --no-input --config-file ./features/feature_specs/localstack.yaml
```

## generate all examples

```sh
git clone https://github.com/devcontainers-contrib/features

for d in ./features/feature_specs/* ; do  cookiecutter ./features/pkgs/feature-template --overwrite-if-exists --no-input --config-file "$d"; done
```
