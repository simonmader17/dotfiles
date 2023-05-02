#!/bin/bash

json=$(gpustat --json)

echo "$(echo "$json" | jq '.gpus[0]."utilization.gpu"')% ($(echo "$json" | jq '.gpus[0]."temperature.gpu"')°C)"
