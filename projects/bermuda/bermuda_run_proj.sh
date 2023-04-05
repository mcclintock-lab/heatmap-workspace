#!/bin/bash

IN=/Users/petermenzies/Library/CloudStorage/Box-Box/SeaSketch/bermuda/filtered-shapes/commercial_fishing
OUT=/Users/petermenzies/Library/CloudStorage/Box-Box/SeaSketch/bermuda/heatmaps/commercial_fishing/weighted

./run_project.sh projects/bermuda $IN $OUT

cd $OUT

/Users/petermenzies/Heatmaps/heatmap-workspace/scripts/sep-logs

