#!/usr/bin/env bash

DEFINITION_VERSION="dev"

# Create the importer image with a version number
docker build --no-cache -t hmctspublic.azurecr.io/sscs/ccd-definition-importer:$DEFINITION_VERSION -f ../../../docker/importer.Dockerfile .

# Create the spreadsheet using the importer image created above
docker run -ti --rm --name json2xlsx \
  -v $(pwd)/data:/data \
  hmctspublic.azurecr.io/sscs/ccd-definition-importer:$DEFINITION_VERSION 
