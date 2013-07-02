#!/bin/bash

for t in $(ls -1 tests/* | xargs -i basename {}); do
    . ./setup.sh $t
    bash -x ./tests/$t 2>&1 | tee -a $t.log
    ./poke-cfg.sh $t
    sed -i "s/$t/tN/g" $t.log
    deactivate
done
