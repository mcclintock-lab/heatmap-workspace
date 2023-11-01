#!/bin/bash

IN=/Users/petermenzies/Projects/norway/cleaned-shapes
# OUT=/Users/petermenzies/Projects/norway/heatmaps
OUT=/Users/petermenzies/Downloads

./run_project.sh projects/norway $IN $OUT

cd $OUT

/Users/petermenzies/Projects/heatmaps/heatmap-workspace/scripts/sep-logs

