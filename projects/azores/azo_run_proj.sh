#!/bin/bash

# IN=/Users/petermenzies/Projects/azores/azo-ous/outputs/phase-2/shapefiles/faial
IN=/Users/petermenzies/Projects/azores/azo-ous-reboot/data/outputs/shapes
OUT=/Users/petermenzies/Library/CloudStorage/Box-Box/GIS/Waitt/Azores/Data_Products/Heatmaps/heatmaps_all_phases
# OUT=/Users/petermenzies/Projects/azores/heatmaps/rec-sports

./run_project.sh projects/azores $IN $OUT

cd $OUT

/Users/petermenzies/Heatmaps/heatmap-workspace/scripts/sep-logs

