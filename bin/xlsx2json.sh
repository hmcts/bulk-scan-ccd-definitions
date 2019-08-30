#!/usr/bin/env bash

if [ $1 != "aat" ] && [ $1 != "demo" ]; then
    echo wrong environment
    exit 1
fi

docker build --no-cache -f ../../../docker/xlsx2json.Dockerfile -t xlsx2json .
echo `pwd`
docker run -v `pwd`/data:/data xlsx2json
../../../bin/template-urls.sh $1
