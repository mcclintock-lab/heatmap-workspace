# heatmap-workspace

Provides a workspace for managing projects for generating `heatmaps` using [seasketch/heatmap](https://github.com/seasketch/heatmap)

## Setup

### Install heatmap Docker image

* Install Docker Desktop and open a terminal
* Install heatmap docker image
```
docker pull seasketch/heatmap:latest
```

### Setup workspace repo
* Fork this repo to your Github organiation or account and clone it locally to your computer
* Run tests
```
./scripts/run_tests.sh
```

* Run the example
```
./run_project.sh projects/canada projects/canada/in projects/canada/out
```

`run_project` - runs the gen_heatmap command within the heatmap docker container for a given project


Usage: `run_project [PATH_TO_PROJECT] [INPUT_PATH] [OUTPUT_PATH]`

When run, Docker mounts the project directory into the container and makes it accessible at the internal path of `/projects/current`.  Your config.json file may/can use this internal current project path for input and output.

Arguments:
* PATH_TO_PROJECT - project directory containing config.json file
* INPUT_PATH (optional): path to directory to mount in containing as `/data/in`.  config.json `infile` can reference this path to find input data.  This supports use case where input data is kept separate from project config and you don't want to make extra copies.
* OUTPUT_PATH (optional): path to directory to mount in containing as `/data/out`.  config.json `outPath` can reference this path to send output heatmaps.  This supports use case where you want to send output to a location outside of this workspace.

## Create your own project

* Create a new folder under projects
* Create a new config.json
  * Point `infile` at `/project/current/[path_to_your_input_file]` if the input data is kept in your project folder.  Or point `infile` at `/data/in/[path_to_your_input_file]` if you keep it outside, just be sure to provide an INPUT_PATH when you `run_project` or else `/data/in` won't exist.
  * `outPath` by default will output heatmaps to the same directory as your input file.  Point `outPath` at `/project/current/[path_to_your_output_folder]` if the output directory is in your project workspace.  Or poitn `outPath` at `/data/out/[path_to_your_output_file]` if you keep it outside, just be sure to provide an OUTPUT_PATH when you `run_project` or else `/data/out` won't exist.

[Old docs to be updated](https://seasketch.github.io/heatmap/install.html#creating-a-new-project)

## Generate test data

If you don't have input data and want to try generating a heatmap quickly, you can generate sample data.  It requires that you already have a project in place, with a config.json containing a bounding box

```
./gen_random_shapes.sh projects/canada projects/canada test_shapes.geojson
```
