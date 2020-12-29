#!/usr/bin/env bash

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

sdk install java 11.0.9.open-adpt

sdk install kotlin 1.4.21
