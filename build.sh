#!/bin/bash

set -euo pipefail

docker build . -t luma-r-env:latest
