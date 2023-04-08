
# SchemaCrawler (via SDKMAN) (schemacrawler-sdkman)

SchemaCrawler is a free database schema discovery and comprehension tool.
SchemaCrawler has a good mix of useful features for data governance. You can
search for database schema objects using regular expressions, and output the
schema and data in a readable text format. The output serves for database
documentation, and is designed to be diff-ed against other database schemas.
SchemaCrawler also generates schema diagrams. You can execute scripts in any
standard scripting language against your database. You can find potential schema
design issues with lint.

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/schemacrawler-sdkman:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version of SchemaCrawler to install. | string | latest |
| jdkVersion | Select or enter a JDK version to install. | string | latest |
| jdkDistro | Select or enter a JDK distribution to install | string | ms |


