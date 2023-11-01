#!/usr/bin/env python3

# print shapes in json config format

import glob
import os

# dir = input("input path >")
dir = '/Users/petermenzies/Projects/heatmaps/gui/heatmaps'
resolution = input("resolution >")

config = ''

print('{"runs": [')

shps = glob.glob(f"{dir}/*fgb")

for i in range(0, len(shps)):
    
    shp = os.path.basename(shps[i])

    if i < len(shps)-1:
        print(f'{{"infile": "/data/in/{shp}"}},')
    else:
        print(f'{{"infile": "/data/in/{shp}"}}')

print("],")
print('"default": {')
print('"outPath": "/data/out",')
print(f'"outResolution": {resolution},')
print('"areaFactor": 1,')
print('"uniqueIdField": "response_id",')
print('"importanceField": "value",')
print('"logToFile": true,')
print('"allTouchedSmall": true,')
print('"overwrite": true')
print('}}')

