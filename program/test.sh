#!/bin/bash

set -e

ALLFILES=`ls ./example -l --time-style="long-iso" | awk '{print $8}'`

EXCLUDE="test.txt|angka.jws|masukan.jwsl|hujan_salju.jwsl|nsk.jwsl"

FILTEREDFILES=`echo $ALLFILES | sed -E "s/$EXCLUDE//g"`


for FILE in $FILTEREDFILES; do
    printf "\n\e[34mRunning \e[90m$FILE\e[39m\n"
    node ./bin/jawaskrip run ./example/$FILE --verbose
done

printf "\n\e[92mDONE!\n"
