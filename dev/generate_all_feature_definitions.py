import os
from devcontainer_contrib.cli.features import generate
from pathlib import Path

import typer


def generate_all_Feature_definitions(
    feature_definitions_dir: str, output_dir: str
) -> None:
    for feature_name in os.listdir(feature_definitions_dir):
        generate(
            Path(
                os.path.join(
                    feature_definitions_dir, feature_name, "feature-definition.json"
                )
            ),
            output_dir=Path(output_dir),
        )


if __name__ == "__main__":
    typer.run(generate_all_Feature_definitions)
