
# Haskell (haskell)

Installs Haskell. An advanced, purely functional programming language

## Example Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/haskell:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| ghcVersion | Select the GHC (Glasgow Haskell Compiler) version to install. | string | recommended |
| cabalVersion | Select the Cabal (a system for building and packaging Haskell libraries and programs) version to install. | string | recommended |
| installStack | Install Stack, a build tool for Haskell. | boolean | true |
| stackVersion | Select the Stack version to install. | string | latest |
| installStackGHCupHook | Enabling this means that stack won't install its own GHC versions, but uses GHCup's | boolean | true |
| adjustBash | whether to adjust PATH in bashrc (prepend) | boolean | true |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/devcontainers-contrib/features/blob/main/src/haskell/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
