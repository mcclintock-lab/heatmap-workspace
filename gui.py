import PySimpleGUI as sg
import os
import glob
import shutil

# Define the layout of the form
layout = [
    [sg.Text('Project name:'), sg.InputText(key='projName')],
    [sg.Text('Input path:'), sg.InputText(key='inputPath')],
    [sg.Text('Ouput path:'), sg.InputText(key='outputPath')],
    [sg.Text('Resolution:'), sg.InputText(default_text='100', key='resolution')],
    [sg.Text('Unique ID field:'), sg.InputText(default_text='response_id', key='uniqueIdField')],
    [sg.Text('Importance field:'), sg.InputText(default_text='value', key='importanceField')],
    [sg.Text('All touched small:'), sg.InputText(default_text='true', key='allTouchedSmall')],
    [sg.Button('Submit'), sg.Button('Cancel')]
]

# Create the window
window = sg.Window('User Input Form', layout, size=(400, 200))

# Read the form
while True:
    event, values = window.read()
    if event in (None, 'Cancel'):
        break
    projName = values['projName']
    projPath = f'./projects/{projName}'
    inputPath = values['inputPath']
    outputPath = values['outputPath']
    resolution = values['resolution']
    uniqueIdField = values['uniqueIdField']
    importanceField = values['importanceField']
    allTouchedSmall = values['allTouchedSmall']

    # generate config.json
    config = ''
    config += '{"runs": ['

    shps = glob.glob(f"{inputPath}/*fgb")

    for i in range(0, len(shps)):
        
        shp = os.path.basename(shps[i])

        if i < len(shps)-1:
            config += f'{{"infile": "/data/in/{shp}"}},'
        else:
            config += f'{{"infile": "/data/in/{shp}"}}'

    config += '],"default": {"outPath": "/data/out","outResolution":' + resolution + f',"areaFactor": 1,"uniqueIdField":"' + uniqueIdField + f'","importanceField":"' + importanceField + '","logToFile": true,"allTouchedSmall":' + allTouchedSmall + ',"overwrite": true}}'

    # create project folder, add config.json to it, and run the project
    os.system(f'mkdir -p projects/{projName}')
    os.system(f'touch projects/{projName}/config.json')
    os.system(f"echo '{config}' > projects/{projName}/config.json")
    os.system(f'./run_project.sh {projPath} {inputPath} {outputPath}')
    os.system(f'mkdir -p {outputPath}/logs && rm {outputPath}/*txt && mv {outputPath}/*json {outputPath}/logs')

# Close the window
window.close()