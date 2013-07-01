#!/bin/bash

venv=$1; shift

if [ -z "$venv" ]; then
  echo "usage: $0 <venv-name>" >&2
  exit 1
fi

echo "Cleaning up $venv"
rm -rf $venv*
