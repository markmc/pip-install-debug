#!/bin/bash

venv=$1; shift

if [ -z "$venv" ]; then
  echo "usage: $0 <venv-name>" >&2
  exit 1
fi

echo "Running pip $@"

(set -x;
 . $venv/bin/activate ;
 pip -vvv "$@" ;
) 2>&1 | tee -a $venv.log
