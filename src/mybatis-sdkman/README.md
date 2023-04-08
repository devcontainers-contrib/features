
# MyBatis Migrations (via SDKMAN) (mybatis-sdkman)

The MyBatis Schema Migration System (or MyBatis Migrations for short) seeks to
provide database migrations for any database (new or existing) and make the
current status of the database easily accessible and comprehensible. Installing
this candidate provides the migrate command for managing database migrations

## Example DevContainer Usage

```json
"features": {
    "ghcr.io/devcontainers-contrib/features/mybatis-sdkman:2": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| version | Select the version of MyBatis Migrations to install. | string | latest |
| jdkVersion | Select or enter a JDK version to install. | string | latest |
| jdkDistro | Select or enter a JDK distribution to install | string | ms |


