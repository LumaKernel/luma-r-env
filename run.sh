#!/bin/bash
set -euo pipefail

CONT_NAME="${1:-luma-r}"
docker rm -f "$CONT_NAME" || true
docker run --rm --name "$CONT_NAME" \
    -v "$(pwd):/home/rstudio" \
    -v "$(pwd):$(pwd)" \
    -p 8787:8787 \
    -e USER=rstudio \
    -e PASSWORD=rstudio \
    -e DISABLE_AUTH=true \
    luma-r-env:latest
