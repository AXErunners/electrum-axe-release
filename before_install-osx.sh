#!/bin/bash
set -ev
brew update

brew install cartr/qt4/pyqt@4
sudo pip2 install Cython

git clone  https://github.com/trezor/cython-hidapi
(cd cython-hidapi; git pull; git submodule init; git submodule update)
(cd cython-hidapi/; sudo python2 setup.py build install)

git clone https://github.com/akhavr/python-trezor
(cd python-trezor/ ; sudo python2 setup.py build install bdist)

sudo pip2 install pyinstaller==3.3
