#!/bin/bash

IN=/Users/petermenzies/Library/CloudStorage/Box-Box/SeaSketch/bermuda/filtered-shapes/suggestions_concerns
OUT=/Users/petermenzies/Library/CloudStorage/Box-Box/SeaSketch/bermuda/heatmaps/suggestions_concerns/weighted

./run_project.sh projects/bermuda $IN $OUT

cd $OUT

/Users/petermenzies/Heatmaps/heatmap-workspace/scripts/sep-logs

