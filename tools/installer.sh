#! /usr/bin/env bash

# -----------------------------------------------------------------
# Author : Jiaobuzuji@163.com
# -----------------------------------------------------------------

declare -r XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
declare -r XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
declare -r XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"

declare -r GITSRVURL="${GITSRVURL:-"github.com.cnpmjs.org"}"  # mirror0: github.com.cnpmjs.org
declare -r NVIMDATA="${NVIMDATA:-"$XDG_DATA_HOME/nvim"}"

mkdir -p ${NVIMDATA}/swap
git clone --depth=1 https://${GITSRVURL}/wbthomason/packer.nvim\
  ${NVIMDATA}/site/pack/packer/opt/packer.nvim

curl -OfSL https://${GITSRVURL}/iamcco/markdown-preview.nvim/releases/download/v0.0.9/markdown-preview-win.zip
curl -OfSL https://${GITSRVURL}/iamcco/markdown-preview.nvim/releases/download/v0.0.9/markdown-preview-linux.tar.gz
tar xvf markdown-preview-linux.tar.gz -C ${NVIMDATA}/site/pack/packer/opt/markdown-preview.nvim/app/bin
rm markdown-preview-linux.tar.gz

python3 -m pip install --user --upgrade pynvim
ln -sf "$HOME/repos/nvim.git" "$XDG_CONFIG_HOME/nvim"
