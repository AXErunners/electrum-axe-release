#!/bin/bash
docker build -f Dockerfile-linux -t axerunners/electrum-axe-release:Linux .
./python-trezor-wine.sh
./python-x11_hash-wine.sh
docker build -f Dockerfile-wine -t axerunners/electrum-axe-release:Wine .
