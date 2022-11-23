import json
import os
import yaml

# loading with the more permitive yaml library just to
# serialize it again using the json library
# this is a way to remove trailing commas from invalid jsons...
# ...
# dont judge me
with open(os.path.join("src", "{{cookiecutter.feature_id}}", "devcontainer-feature.json"), "r") as f:
    data = yaml.safe_load(f)
with open(os.path.join("src", "{{cookiecutter.feature_id}}", "devcontainer-feature.json"), "w") as f:
    json.dump( data, f, indent=4)
