#!/bin/bash
# Opens a shell in a heatmap contain, with projects folder mounted to /projects

docker run --rm -it \
    --volume "$(pwd)"/projects:/projects \
    seasketch/heatmap:latest \
    /bin/bash
