#! /usr/bin/env bash

# -----------------------------------------------------------------
# Author : Jiaobuzuji@163.com
# -----------------------------------------------------------------


[ -z "${GITSRVURL}" ] && GITSRVURL="github.com.cnpmjs.org" # mirror0: github.com.cnpmjs.org
[ -z "${NVIMDATA}" ] && NVIMDATA="$HOME/.local/share/nvim"

  git clone https://${GITSRVURL}/wbthomason/packer.nvim\
   ${NVIMDATA}/site/pack/packer/start/packer.nvim
