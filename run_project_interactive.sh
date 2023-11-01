#!/bin/bash
# Runs gen_heatmap on provided project.  Can optionally mount an input path and an output path if they are outside of the project space
# run_project [PATH_TO_PROJECT.JSON] [INPUT_PATH] [OUTPUT_PATH]

read -p "Project folder name: " PROJECT_NAME
PATH_TO_PROJECT=./projects/$PROJECT_NAME
read -p "Path to input data: " INPUT_PATH
read -p "Path to output dir: " OUTPUT_PATH

set -x

docker run -it \
    -v "$(scripts/readlink ${PATH_TO_PROJECT})":/projects/current \
    -v "$(scripts/readlink ${INPUT_PATH})":/data/in \
    -v "$(scripts/readlink ${OUTPUT_PATH})":/data/out \
    seasketch/heatmap:latest \
    bash -c "/work/scripts/gen_heatmap /projects/current/config.json"
