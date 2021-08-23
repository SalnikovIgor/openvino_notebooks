#!/bin/bash

set -e

IGNORED_NOTEBOOKS=""

while (( "$#" )); do
  case "$1" in
    --ignore)
      IGNORED_NOTEBOOKS="${IGNORED_NOTEBOOKS} --ignore=$2"
      shift 2
      ;;
    *)
      echo Unsupport argument $1
      exit 1
      ;;
  esac
done

PYTHONHTTPSVERIFY=0 python3 -m pytest --nbval ${IGNORED_NOTEBOOKS} .