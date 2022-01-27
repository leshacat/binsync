#!/usr/bin/env bash

# Autofilled Variables (do not change)
export vPWD=$(pwd)
export vPATH=$(echo $PATH)

# Get calling script's directory
SOURCE=${BASH_SOURCE[0]}
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
vSOURCEDIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )

export vVER=$(cat ${vPWD}/.binsync.version)

if test -f "${vPWD}/.binsync.config"; then
  source ${vPWD}/.binsync.config
else
  echo "${vPWD}/.binsync.config does not exist, please read the README.md!"
  echo ""
  exit
fi

echo ""
echo "install binsync ${vVER} [${vDIRECTORY}]"
echo ""
echo "user                [$vUSER]"
echo "host                [$vHOST]"
echo "source directory    [$vSOURCEDIR]"
echo "working directory   [$vPWD]"
echo "binsync directory   [$vPATH]"
echo "bin directory       [$vDIRECTORY]"
echo ""

vRSYNC=$(dpkg-query -l rsync)
if [[ "no packages found matching" == *"${vRSYNC}"* ]]; then
  echo "installing rsync"
  echo ""
  apt update
  echo ""
  apt install -y rsync
  echo ""
fi

# Make the directory where bins will reside
mkdir -p ${vDIRECTORY}

# Change the repo dir in scripts (THISISREPODIRPLACEHOLDERDONOTTOUCH)
sed -i "s/THISISREPODIRPLACEHOLDERDONOTTOUCH/${vPWD}/" ${vPWD}/binsync-*

# Copy the binsync scripts
cp ${vSOURCEDIR}/binsync-* ${vDIRECTORY}
#cp ${vSOURCEDIR}/.binsync.config ${vSOURCEDIR}/.binsync.config.clear ${vDIRECTORY}

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
source ${vSOURCEDIR}/.binsync.config.clear
