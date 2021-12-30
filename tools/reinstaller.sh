#! /usr/bin/env bash

sudo cp -af /usr/share/nvim/runtime/plugin/nvim_gui_shim.vim .
sudo rm -rf /usr/bin/nvim
sudo rm -rf /usr/lib/nvim/
sudo rm -rf /usr/share/applications/nvim.desktop
sudo rm -rf /usr/share/icons/hicolor/128x128/apps/nvim.png
sudo rm -rf /usr/share/locale/*/*/nvim.mo
sudo rm -rf /usr/share/man/man1/nvim.1
sudo rm -rf /usr/share/nvim/
# sudo rm -rf /usr/bin/nvim-qt
# sudo rm -rf /usr/share/nvim/runtime/plugin/nvim_gui_shim.vim

# cp -af $HOME/.local/share/nvim/runtime/plugin/nvim_gui_shim.vim .
# rm -rf $HOME/.local/bin/nvim
# rm -rf $HOME/.local/lib/nvim/
# rm -rf $HOME/.local/share/applications/nvim.desktop
# rm -rf $HOME/.local/share/icons/hicolor/128x128/apps/nvim.png
# rm -rf $HOME/.local/share/locale/*/*/nvim.mo
# rm -rf $HOME/.local/share/man/man1/nvim.1
# rm -rf $HOME/.local/share/nvim/runtime
# # rm -rf $HOME/.local/bin/nvim-qt
# # rm -rf $HOME/.local/share/nvim/runtime/plugin/nvim_gui_shim.vim

# curl -OfSL https://github.com.cnpmjs.org/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
curl -OfSL https://github.com.cnpmjs.org/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xvf nvim-linux64.tar.gz
sudo \cp -a nvim-linux64/* /usr/
sudo \mv nvim_gui_shim.vim /usr/share/nvim/runtime/plugin/
# \cp -a nvim-linux64/* $HOME/.local/
# \mv nvim_gui_shim.vim $HOME/.local/share/nvim/runtime/plugin/
\rm -rf nvim-linux64.tar.gz
\rm -rf nvim-linux64

# Remove default plugins
if [ -d /usr/share/nvim/runtime/plugin ]; then
  rm /usr/share/nvim/runtime/plugin/gzip.vim
  # rm /usr/share/nvim/runtime/plugin/health.vim
  # rm /usr/share/nvim/runtime/plugin/man.vim
  rm /usr/share/nvim/runtime/plugin/matchit.vim
  rm /usr/share/nvim/runtime/plugin/matchparen.vim
  rm /usr/share/nvim/runtime/plugin/netrwPlugin.vim
  # rm /usr/share/nvim/runtime/plugin/shada.vim
  rm /usr/share/nvim/runtime/plugin/spellfile.vim
  rm /usr/share/nvim/runtime/plugin/tarPlugin.vim
  rm /usr/share/nvim/runtime/plugin/tohtml.vim
  rm /usr/share/nvim/runtime/plugin/tutor.vim
  rm /usr/share/nvim/runtime/plugin/zipPlugin.vim
fi

