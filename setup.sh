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

 pip -vvv install --upgrade pip
 rm -rf ./$venv/src/pip
 pip -vvv install --upgrade -e git+https://github.com/markmc/pip.git@master#egg=pip ;
) 2>&1 | tee -a $venv.log

. $venv/bin/activate
