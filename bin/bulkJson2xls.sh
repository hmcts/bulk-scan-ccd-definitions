#!/usr/bin/env bash


for dir in */; do
    if [ -d "$dir" ]; then
        cd "$dir"
        echo "********* start json2xlsx in $(pwd)"
        ../../bin/json2xlsx.sh $1
        cd ..
    fi
done