#!/usr/bin/env bash

echo ""
echo "binsync-push ${vDIRECTORY}"
echo ""

PWD=$(pwd)
if test -f "${PWD}/config.inc"; then
  source ${PWD}/config.inc
else
  echo "${PWD}/config.inc does not exist, please read the README.md!"
  echo ""
  exit
fi

# Install binsync

# Clear ENV vars for security
source ${PWD}/config.clear.inc
