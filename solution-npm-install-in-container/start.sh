#!/bin/bash

start=`date +%s`

npm install --legacy-peer-deps

end=`date +%s`
runtime=$(echo "$end - $start" | bc -l)
echo "#### Runtime: $runtime seconds ####"

echo "Hit CTRL+C"
tail -f /dev/null
