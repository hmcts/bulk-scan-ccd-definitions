#!/usr/bin/env bash

if [ $1 != "aat" ] && [ $1 != "demo" ]; then
    echo "wrong environment"
    exit 1
fi

THEPATH=`pwd`
ENVPATH=`dirname "$THEPATH"`
ENVFOLDER=`basename "$ENVPATH"`

echo $ENVFOLDER

if [ "$ENVFOLDER" != "$1" ]; then
    echo "you are in $ENVFOLDER folder, but environment arg= $1"
    exit 1
fi

docker build --no-cache -f ../../../docker/xlsx2json.Dockerfile -t xlsx2json .
echo `pwd`
docker run -v `pwd`/data:/data xlsx2json
../../../bin/template-urls.sh $1
