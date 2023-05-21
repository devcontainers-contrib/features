#!/bin/bash -i

set -e

source ./library_scripts.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# and if missing - will download a temporary copy that automatically get deleted at the end 
# of the script
ensure_nanolayer nanolayer_location "v0.4.39"


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/bash-command:1.0.0" \
    --option command='curl -L https://cdn.porter.sh/latest/install-linux.sh | PORTER_VERSION=$VERSION PORTER_HOME=/usr/local/porter bash -s -- -x'
    


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/bash-command:1.0.0" \
    --option command='/usr/local/porter/porter mixin install terraform --version $TERRAFORMMIXINVERSION'
    


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/bash-command:1.0.0" \
    --option command='/usr/local/porter/porter mixin install az --version $AZMIXINVERSION'
    


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/bash-command:1.0.0" \
    --option command='/usr/local/porter/porter mixin install aws --version $AWSMIXINVERSION'
    


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/bash-command:1.0.0" \
    --option command='/usr/local/porter/porter mixin install docker --version $DOCKERMIXINVERSION'
    


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/bash-command:1.0.0" \
    --option command='/usr/local/porter/porter mixin install docker-compose --version $DOCKERCOMPOSEMIXINVERSION'
    


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/bash-command:1.0.0" \
    --option command='/usr/local/porter/porter mixin install gcloud --version $GCLOUDMIXINVERSION'
    


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/bash-command:1.0.0" \
    --option command='/usr/local/porter/porter mixin install helm --version $HELMMIXINVERSION'
    


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/bash-command:1.0.0" \
    --option command='/usr/local/porter/porter mixin install arm --version $ARMMIXINVERSION'
    


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/bash-command:1.0.0" \
    --option command='/usr/local/porter/porter plugin install azure --version $AZUREPLUGINVERSION'
    


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/bash-command:1.0.0" \
    --option command='/usr/local/porter/porter plugin install kubernetes --version $KUBERNETESPLUGINVERSION'
    


$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/bash-command:1.0.0" \
    --option command='chown -hR ${_REMOTE_USER}:${_REMOTE_USER} /usr/local/porter'
    


echo 'Done!'

