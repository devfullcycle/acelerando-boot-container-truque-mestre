#!/bin/bash

start=`date +%s`

npm ls | grep ERR

rsync -arv /home/node/cache/node_modules/ /home/node/app/node_modules/

end=`date +%s`
runtime=$(echo "$end - $start" | bc -l)
echo "#### Runtime: $runtime seconds ####"

echo "Hit CTRL+C"
tail -f /dev/null