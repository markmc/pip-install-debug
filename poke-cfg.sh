#!/bin/bash

venv=$1; shift

if [ -z "$venv" ]; then
  echo "usage: $0 <venv-name>" >&2
  exit 1
fi

echo "Probing oslo.config in $venv"

(set -x;
 . $venv/bin/activate ;
 pip freeze | grep oslo.config ;
 python -c 'from oslo.config.cfg import DeprecatedOpt'
) 2>&1 | tee -a $venv.log
