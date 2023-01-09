#!/bin/bash

# run_project [PATH_TO_PROJECT.JSON] [INPUT_PATH] [OUTPUT_PATH]

#./run_project.sh /projects/azores /home/twelch/src/azo-ous/outputs/flores-corvo-santamaria/shapefiles/santa-maria

PATH_TO_PROJECT=$1
OUTPUT_PATH=$2
OUTFILE=$3

set -x

docker run -it \
    -v "$(scripts/readlink.sh ${PATH_TO_PROJECT})":/projects/current \
    -v "$(scripts/readlink.sh ${OUTPUT_PATH})":/data/out \
    seasketch/heatmap:latest \
    bash -c "cd /work && /work/scripts/gen_random_shapes /projects/current/config.json /data/out/${OUTFILE}"
