#! /usr/bin/env bash

# -----------------------------------------------------------------
# Author : Jiaobuzuji@163.com
# -----------------------------------------------------------------

declare -r XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
declare -r XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
declare -r XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"

declare -r GITSRVURL="${GITSRVURL:-"github.com.cnpmjs.org"}"  # mirror0: github.com.cnpmjs.org
declare -r NVIMDATA="${NVIMDATA:-"$XDG_DATA_HOME/nvim-data"}"

mkdir -p ${NVIMDATA}/swap
git clone --depth=1 https://${GITSRVURL}/wbthomason/packer.nvim\
  ${NVIMDATA}/site/pack/packer/start/packer.nvim

