#!/bin/bash
BUILD_REPO_URL=https://github.com/axerunners/electrum-axe.git

if [[ -z $TRAVIS_TAG ]] || [[ $TRAVIS_TAG == develop ]]; then
  git clone $BUILD_REPO_URL electrum-axe
else
  git clone --branch $TRAVIS_TAG $BUILD_REPO_URL electrum-axe
fi

docker run --rm -v $(pwd):/opt -w /opt/electrum-axe -t axerunners/electrum-axe-release:Linux /opt/build_linux.sh
docker run --rm -v $(pwd):/opt -v $(pwd)/electrum-axe/:/root/.wine/drive_c/electrum -w /opt/electrum-axe -t axerunners/electrum-axe-release:Wine /opt/build_wine.sh
