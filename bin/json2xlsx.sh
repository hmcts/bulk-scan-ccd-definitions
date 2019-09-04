#!/usr/bin/env bash

if [ "$1" != "aat" ] && [ "$1" != "demo" ]  && [ "$1" != "prod" ]; then
    echo "wrong environment"
    exit 1
fi



DEFINITION_VERSION="dev"

THEPATH=`pwd`
ENVPATH=$(dirname $(dirname $THEPATH))
CASETYPE=`basename "$THEPATH"`
FILENAME="$1-$CASETYPE-created-ccd"


# Create the importer image with a version number
docker build --no-cache --build-arg FILE_NAME=$FILENAME --build-arg  ENV_VAR=$1 \
  -t hmctspublic.azurecr.io/sscs/ccd-definition-importer:$DEFINITION_VERSION -f ../../docker/importer.Dockerfile .


# Create the spreadsheet using the importer image created above
docker run -ti --rm --name json2xlsx \
  -v $(pwd)/data:/data  -v $ENVPATH/env:/env \
  hmctspublic.azurecr.io/sscs/ccd-definition-importer:$DEFINITION_VERSION 
