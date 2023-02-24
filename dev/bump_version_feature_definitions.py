import os
from pathlib import Path

import typer
import semver

from devcontainer_contrib.models.devcontainer_feature_definition import (
    FeatureDefinition,
)
from enum import Enum


class VersionType(Enum):
    patch = "patch"
    minor = "minor"
    major = "major"


def bump_version_feature_definitions(
    feature_definitions_dir: str, version_type: VersionType
) -> None:
    for feature_name in os.listdir(feature_definitions_dir):
        feature_definition_file = os.path.join(
            feature_definitions_dir, feature_name, "feature-definition.json"
        )

        feature_definition = FeatureDefinition.parse_file(feature_definition_file)
        semver_version = semver.VersionInfo.parse(feature_definition.version)

        if version_type == VersionType.patch:
            bumped_semver = semver_version.bump_patch()
        elif version_type == VersionType.minor:
            bumped_semver = semver_version.bump_minor()

        elif version_type == VersionType.major:
            bumped_semver = semver_version.bump_major()
        else:
            raise ValueError(f"invalid version type: {version_type}")

        feature_definition.version = str(bumped_semver)

        with open(feature_definition_file, "w+") as f:
            f.write(feature_definition.json(exclude_none=True, indent=4))


if __name__ == "__main__":
    typer.run(bump_version_feature_definitions)
