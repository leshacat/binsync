#!/usr/bin/env bash

echo ""
echo "install binsync ${vDIRECTORY}"
echo ""

PWD=$(pwd)
if test -f "${PWD}/.binsync.config"; then
  source ${PWD}/.binsync.config
else
  echo "${PWD}/.binsync.config does not exist, please read the README.md!"
  echo ""
  exit
fi

# Get / fill variables
vPWD=$(pwd)
vPATH=$(echo $PATH)

echo "working directory   [$vPWD]"
echo "binsync directory   [$vPATH]"
echo "bin directory       [$vDIRECTORY]"
echo ""

# Make the directory where bins will reside
mkdir -p ${vDIRECTORY}

# Copy the binsync scripts
cp ${vPWD}/binsync-* ${vDIRECTORY}
cp ${vPWD}/.binsync.config* ${vDIRECTORY}

# Check if vDIRECTORY is added to $PATH
if [[ "${vPATH}" == *"${vDIRECTORY}"* ]]; then
  echo "Binsync directory already in path [${vPATH}]"
  echo ""
else
  echo "Adding binsync directory to \$PATH"
  echo "export PATH=${HOME}/bin:\$PATH" | tee -a ${HOME}/.bashrc
  echo ""
  echo "Please execute 'source ${HOME}/.bashrc' or log out and back in again"
  echo ""
fi

echo "binsync installation is complete!"
echo ""

# Clear ENV vars for security
source ${PWD}/.binsync.config.clear
