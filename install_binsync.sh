#!/usr/bin/env bash

echo ""
echo "binsync-push ${vDIRECTORY}"
echo ""

PWD=$(pwd)
if test -f "${PWD}/config.inc"; then
  echo "Loading configuration (${PWD}/config.inc)"
  echo ""
  source ${PWD}/config.inc
else
  echo "${PWD}/config.inc does not exist, please read the README.md!"
  echo ""
  exit
fi

# Get / fill variables
vPWD=$(pwd)
vPATH=$(echo $PATH)

echo "[$vPWD] [$vDIRECTORY] [$vPATH]"

exit

# Make the directory where bins will reside
mkdir -p ${vDIRECTORY}

# Copy the binsync scripts
cp ${vPWD}/binsync-* ${vDIRECTORY}

# Check if vDIRECTORY is added to $PATH
if [[ "${vDIRECTORY}" != *"${vPATH}"* ]]; then
  echo ""
  echo "Adding binsync directory to \$PATH"
  echo "export PATH=${HOME}/bin:\$PATH" | tee -a ${HOME}/.bashrc
  echo ""
  echo "Please execute 'source ${HOME}/.bashrc' or log out and back in again"
  echo ""
fi

# Clear ENV vars for security
source ${PWD}/config.clear.inc
