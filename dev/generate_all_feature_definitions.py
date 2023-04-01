import os
from dcontainer.devcontainer.feature_generation.oci_feature_generator import OCIFeatureGenerator
from pathlib import Path

import typer
import shutil


def generate_all_Feature_definitions(
    feature_definitions_dir: str, output_dir: str ,remove_old_content: bool = True,
) -> None:

    for feature_name in os.listdir(feature_definitions_dir):
        if remove_old_content and os.path.exists(os.path.join(
                    "test", feature_name
                ) ):
            shutil.rmtree(os.path.join(
                        "test", feature_name
                    )
                    )
        if remove_old_content and os.path.exists(os.path.join(
                    "src", feature_name
                ) ):
            shutil.rmtree(os.path.join(
                        "src", feature_name
                    )
                    )

        OCIFeatureGenerator.generate(
            Path(
                os.path.join(
                    feature_definitions_dir, feature_name, "feature-definition.json"
                )
            ),
            output_dir=Path(output_dir),
            nanolayer_version="v0.4.0"
        )


if __name__ == "__main__":
    typer.run(generate_all_Feature_definitions)
