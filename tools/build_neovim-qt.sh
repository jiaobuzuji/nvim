#!/usr/bin/env bash

# -----------------------------------------------------------------
# Author : Jiaobuzuji@163.com
# -----------------------------------------------------------------

# CentOS 7
# sudo yum install -y qt5-qtsvg-devel
# sudo yum install -y centos-release-scl
# sudo yum install -y devtoolset-8
# source /opt/rh/devtoolset-8/enable # temporary

# Ubuntu
# sudo apt install -y cmake build-essential qt5-qmake qt5-qmake-bin qtbase5-dev \
#   qtbase5-dev-tools libqt5svg5-dev qtchooser libqt5concurrent5 libqt5core5a libqt5dbus5 \
#   libqt5gui5 libqt5network5 libqt5widgets5 libqt5xml5 neovim

# mkdir build
# cd build
# cmake -DCMAKE_BUILD_TYPE=Release ..
# make
# # If the build was successful, you can start `neovim-qt`.
# set NVIM_QT_RUNTIME_PATH=../src/gui/runtime ./bin/nvim-qt

