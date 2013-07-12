#!/bin/bash


venv=$1; shift

if [ -z "$venv" ]; then
  echo "usage: $0 <venv-name>" >&2
  exit 1
fi

echo "Setting up $venv"

(set -x;
 virtualenv $venv;
 . $venv/bin/activate ;

 pip -vvv install --upgrade -e git+https://github.com/pypa/pip.git#egg=pip-1.4rc3 ;
) 2>&1 | tee -a $venv.log

. $venv/bin/activate
