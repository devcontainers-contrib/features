import os
from dcontainer.cli.generate.generate_feature import generate
from pathlib import Path

import typer
import shutil


def generate_all_Feature_definitions(
    feature_definitions_dir: str, output_dir: str
) -> None:
    

    for feature_name in os.listdir(feature_definitions_dir):
        if os.path.exists(os.path.join(
                    "test", feature_name
                ) ):
            shutil.rmtree(os.path.join(
                        "test", feature_name
                    )
                    )

        generate(
            Path(
                os.path.join(
                    feature_definitions_dir, feature_name, "feature-definition.json"
                )
            ),
            output_dir=Path(output_dir),
            release_version="v0.2.1"
        )


if __name__ == "__main__":
    typer.run(generate_all_Feature_definitions)
