#!/bin/bash

# IN=/Users/petermenzies/Projects/azores/azo-ous/outputs/phase-2/shapefiles/faial
IN=/Users/petermenzies/Projects/maldives/shapes/combined_shps
# OUT=/Users/petermenzies/Library/CloudStorage/Box-Box/GIS/Waitt/Azores/Data_Products/Heatmaps/Phase_2_heatmaps_final
OUT=/Users/petermenzies/Library/CloudStorage/Box-Box/GIS/Waitt/Maldives_Blue_Prosperity/Data_Products/OUS/mdv-heatmaps-final/high-res

./run_project.sh projects/maldives $IN $OUT

cd $OUT

/Users/petermenzies/Heatmaps/heatmap-workspace/scripts/sep-logs

