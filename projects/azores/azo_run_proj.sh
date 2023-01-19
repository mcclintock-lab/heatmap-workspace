#!/bin/bash

IN=/Users/menzies/Projects/azores/azo-ous/outputs/phase-3/shapefiles/saomiguel
OUT=/Users/menzies/Library/CloudStorage/Box-Box/GIS/Waitt/Azores/Data_Products/Heatmaps/Phase_3_heatmaps_draft

./run_project.sh projects/azores $IN $OUT

cd $OUT

/Users/menzies/Heatmaps/heatmap-workspace/scripts/sep-logs

