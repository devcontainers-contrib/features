
# Neo4j-Migrations (via SDKMAN) (neo4jmigrations-sdkman)

Neo4j-Migrations is a database migration and refactoring tool that allows
running Cypher scripts and programmatic refactorings in a controlled and
repeatable fashion against one or more Neo4j database.

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/neo4jmigrations-sdkman:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version of Neo4j-Migrations to install. | string | latest |
| jdkVersion | Select or enter a JDK version to install. | string | latest |
| jdkDistro | Select or enter a JDK distribution to install | string | ms |


