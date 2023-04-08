
# apt-get packages (for Debian/Ubuntu) (apt-get-packages)

apt-get is a command line tool for interacting with the Advanced Package Tool (APT) library (a package management system for Linux distributions).

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/apt-get-packages:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| packages | Comma separated list of packages. | string | - |
| ppas | Comma separated list of required ppas (not recommended) | string | - |
| clean_ppas | If ppas used, remove them after usage in order to increase safety | boolean | True |
| preserve_apt_list | Preserving the existing apt list (the result of apt-get update) will decrease container layer size (but will require a re-update of the packages database on next install) | boolean | True |
| force_ppas_on_non_ubuntu | Installing ppas on a non-ubuntu distro (eg. debian) is discouraged | boolean | - |


