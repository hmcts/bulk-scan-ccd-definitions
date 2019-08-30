#!/usr/bin/env bash

FILES="`pwd`/data/sheets/*.json"


if [[ "$1" == "aat" ]]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
      sed -i '' 's/\${BULK_SCAN_ORCHESTRATOR_URL}/http:\/\/bulk-scan-orchestrator-aat.service.core-compute-aat.internal/g' $FILES
      sed -i '' 's/\${BULK_SCAN_SSCS_URL}/http:\/\/sscs-bulk-scan-aat.service.core-compute-aat.internal/g' $FILES
    else      
      sed -i 's/\${BULK_SCAN_ORCHESTRATOR_URL}/http:\/\/bulk-scan-orchestrator-aat.service.core-compute-aat.internal/g'  $FILES
      sed -i 's/\${BULK_SCAN_SSCS_URL}/http:\/\/sscs-bulk-scan-aat.service.core-compute-aat.internal/g' $FILES
    fi
elif [[ "$1" == "demo" ]]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
      sed -i '' 's/\${BULK_SCAN_ORCHESTRATOR_URL}/http:\/\/bulk-scan-orchestrator-demo.service.core-compute-demo.internal/g' $FILES
      sed -i '' 's/\${BULK_SCAN_SSCS_URL}/http:\/\/sscs-bulk-scan-demo.service.core-compute-demo.internal/g' $FILES
    else      
      sed -i 's/\${BULK_SCAN_ORCHESTRATOR_URL}/http:\/\/bulk-scan-orchestrator-demo.service.core-compute-demo.internal/g'  $FILES
      sed -i 's/\${BULK_SCAN_SSCS_URL}/http:\/\/sscs-bulk-scan-demo.service.core-compute-demo.internal/g' $FILES
    fi
 fi
